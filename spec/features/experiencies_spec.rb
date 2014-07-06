require 'spec_helper'

feature 'Experiencies managent' do

  let!(:user) {create(:user)}

  scenario 'login require' do
    visit experiences_path
    expect(page).to have_button('Sign in')
  end
  
  scenario 'add a new experience' do
    sign_in user
    visit experiences_path
    first(:link,'New Experience').click
    fill_in :experience_name, with: "Incaztech S. de R.L."
    fill_in :experience_description, with: "Empresa dedicada al software"
    click_button("Crear Experience")
    expect(page).to have_content('Experience was successfully created.')
  end

end
