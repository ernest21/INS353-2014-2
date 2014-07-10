class Student < ActiveRecord::Base
   validates :name, presence: true
   validates :university_id, numericality: true
   has_many :grades
   accepts_nested_attributes_for :grades,:allow_destroy => true,:reject_if     => :all_blank

  def average_grade
    average=self.grades.all.inject(0){|r,g|r+=g.scrore}
    begin
      return average/self.grades.size
    rescue Exception => e
      return 0
    end
  end
end
