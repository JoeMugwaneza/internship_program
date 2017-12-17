class Application < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  belongs_to :field_of_study
  has_one :internship_update, :dependent => :destroy
  belongs_to :district
  belongs_to :sector

  scope :got_internship, -> {where(internship_placement: true)}
  scope :looking_internship, -> {where(internship_placement: false) }

  validates_uniqueness_of :user_id

  def full_name
    user = self.user
    return full_name =  "#{user.first_name} #{user.last_name}"
  end

  def gender
    if self.is_female == true
      return "Female"
    elsif self.is_female == false
      return "Male"
    else
      return "Unspecified"
    end
  end

  def self.search(searchQuery)
    field_of_study_id = searchQuery['field_of_study_id'].to_i
    district_id = searchQuery['district_id'].to_i
    sector_id = searchQuery['sector_id'].to_i
    if field_of_study_id != 0 && sector_id == 0 && district_id == 0
      where(field_of_study_id: field_of_study_id)
    elsif field_of_study_id == 0 && sector_id == 0 && district_id != 0
      where(district_id: district_id)
    elsif field_of_study_id == 0 && sector_id != 0 && district_id != 0
      where("district_id =? AND district_id =?", district_id, district_id)
    elsif field_of_study_id != 0 && sector_id != 0 && district_id != 0
      where("district_id =? AND field_of_study_id =? AND sector_id =?", district_id, field_of_study_id, sector_id)
    elsif field_of_study_id != 0 && sector_id == 0 && district_id != 0
      where("district_id =? AND field_of_study_id =?", district_id, field_of_study_id)
    end
  end


  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_district_id,
      :with_created_at_gte
    ]
)

  scope :sorted_by, lambda { |sort_option|

    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s

    when /^created_at_/
    order("applications.created_at #{ direction }")

    when /^name_/
      order("LOWER(users.last_name) #{ direction }, LOWER(users.first_name) #{ direction }").joins(:user)

      when /^country_name_/
        order("LOWER(districts.name) #{ direction }").includes(:district)
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
      end
  }

  scope :search_query, lambda {|query|

    return nil if query.blank?
    terms = query.downcase.split(/\s+/)
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    num_or_conds = 1
    where(
      terms.map {|term|
        "LOWER(applications.user.first_name) LIKE ? OR LOWER(applications.user.last_name) LIKE ?"
        }.join('AND'),
        *terms.map {|e| [e] *num_or_conds}.flatten
        )
  }

  scope :with_district_id, lambda {|district_ids|
    where(district_id: [*district_ids])
  }
  
  scope :with_created_at_gte, lambda {|ref_date|
    where('applications.created_at >= ?', ref_date)
  }


  def self.options_for_sorted_by
    [
      ['Name (a-z)', 'name_asc'],
      ['Application date (newest first)', 'created_at_desc'],
      ['Application date (oldest first)', 'created_at_asc'],
      ['District (a-z)', 'district_name_asc']
    ]
    
  end
end
