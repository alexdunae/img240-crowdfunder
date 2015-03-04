# Crowdfunder seed data

puts 'Deleting any existing data...'
[Pledge, FundingLevel, Project].each { |model| model.destroy_all }

puts 'Adding data...'
nanny = Project.create(
                  name: 'Robot Nanny',
                  description: "This robot nanny will care for your kids, your pets and even you!\n\nRequires very little maintenance.\n\nPledge and help us build the future!")

nanny.funding_levels.create(reward_name: 'Robot Nanny - Purple', amount: 100)
nanny.funding_levels.create(reward_name: 'Robot Nanny - Pink', amount: 120)
nanny.funding_levels.create(reward_name: 'Robot Nanny - Collector’s Edition', amount: 250)


jetpack = Project.create(
                  name: 'Personal Jetpack',
                  description: "After four years of messing around in our basements, we're finally ready to start production on our Personal Jetback 3000.\n\nOur goal is to raise $100,000,000 to build our factory, get government approval and patent our technology.")

jetpack.funding_levels.create(reward_name: 'T-shirt', amount: 10)
jetpack.funding_levels.create(reward_name: 'T-shirt plus Coffee Table Book', amount: 100)
jetpack.funding_levels.create(reward_name: 'Personal Jetpack plus Helmet', amount: 1000)

names = ['Christina', 'Elder', 'Evelyn', 'Henrique', 'Jéssica', 'Kerene', 'Lucas', 'Lucas', 'Maria', 'Melissa', 'Mike', 'Raphael', 'Ronaldo', 'Steve', 'Thiago', 'Vance']

funding_level_ids = FundingLevel.pluck(:id)

names.each do |name|

  funding_level_id = funding_level_ids.sample
  funding_level = FundingLevel.find(funding_level_id)

  funding_level.pledges.create(
            name: name,
            amount: funding_level.amount,
            email: "#{name.downcase}@example.com")
end
