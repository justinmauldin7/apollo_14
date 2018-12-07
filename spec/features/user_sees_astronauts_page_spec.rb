require 'rails_helper'

describe 'A user sees the astronauts show page with content' do
  it 'shows astronauts' do
    astronaut_1 = Astronaut.create(name: "Tom", age: 29, job: "Engineer")
    astronaut_2 = Astronaut.create(name: "Ted", age: 39, job: "Engineer2")

    mission_1 = Mission.create(title: "Apollo 14", time_in_space: 200)

    rel_1 = AstronautMission.create(astronaut_id: astronaut_1.id, mission_id: mission_1.id)
    rel_2 = AstronautMission.create(astronaut_id: astronaut_2.id, mission_id: mission_1.id)

    visit astronauts_path

    expect(page).to have_content(astronaut_1.name)
    expect(page).to have_content(astronaut_1.age)
    expect(page).to have_content(astronaut_1.job)
    expect(page).to have_content(astronaut_2.name)
    expect(page).to have_content(astronaut_2.age)
    expect(page).to have_content(astronaut_2.job)
  end
end
