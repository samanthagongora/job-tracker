Company.destroy_all
Job.destroy_all
Contact.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATEGORIES = ["Web Development", "Education", "Finance", "Web Development", "Education", "Finance", "Web Development", "Education", "Finance", "Web Development"]

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample, category: Category.find_or_initialize_by(title: CATEGORIES[num]))
    puts "  Created #{company.jobs[num].title}"
  end

  10.times do |num|
    company.contacts.create!(first_name: "first#{num}", last_name: "last#{num}", position: "position#{num}", email: "email#{num}", company: company )
    puts "  Created #{company.contacts[num]}"
  end
end
