require "application_system_test_case"

class TrainingResourcesTest < ApplicationSystemTestCase
  setup do
    @training_resource = training_resources(:one)
  end

  test "visiting the index" do
    visit training_resources_url
    assert_selector "h1", text: "Training resources"
  end

  test "should create training resource" do
    visit new_training_resource_url

    fill_in "Author", with: @training_resource.author
    fill_in "Long description", with: @training_resource.long_description
    fill_in "Short description", with: @training_resource.short_description
    fill_in "Title", with: @training_resource.title
    click_on "Create"

    assert_text "Training resource was successfully created"
    click_on "Back"
  end

  test "should update Training resource" do
    visit training_resource_url(@training_resource)
    click_on "Edit", match: :first

    fill_in "Author", with: @training_resource.author
    fill_in "Long description", with: @training_resource.long_description
    fill_in "Short description", with: @training_resource.short_description
    fill_in "Title", with: @training_resource.title
    click_on "Update"

    assert_text "Training resource was successfully updated"
    click_on "Back"
  end

  test "should destroy Training resource" do
    visit training_resource_url(@training_resource)
    click_on "Delete", match: :first

    assert_text "Training resource was successfully destroyed"
  end
end
