require 'spec_helper'

feature 'Experiencies managent', js: true do
    let!(:user) {create(:user)}
  scenario 'verfied user' do
     visit experiences_path
     expect(page).to have_button('Sign in')
  end
  scenario 'adds a new experience' do
    sign_in user
     visit experiences_path
     click_link ('New Experience')
     fill_in :experience_name, with: "Incaztech S. de R.L."
     fill_in :experience_description, with: "Empresa dedicada al software"
     click_button("Crear Experience")
     expect(page).to have_content('Experience was successfully created.')

  end
end
