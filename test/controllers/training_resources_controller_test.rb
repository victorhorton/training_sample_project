require "test_helper"

class TrainingResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training_resource = training_resources(:one)
    @tag1 = tags(:tag_one)
    @tag2 = tags(:tag_two)
    @training_resource.tags << [ @tag1, @tag2 ]

    @admin = users(:admin)  # Assuming you have an admin user in your fixtures
    post login_url, params: { username: @admin.username, password: "password" }
  end

  test "should get index" do
    get training_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_training_resource_url
    assert_response :success
  end

  test "should create training_resource" do
    assert_difference("TrainingResource.count") do
      post training_resources_url, params: { training_resource: { author: @training_resource.author, long_description: @training_resource.long_description, short_description: @training_resource.short_description, title: @training_resource.title, duration: @training_resource.duration, youtube_video_id: @training_resource.youtube_video_id } }
    end

    assert_redirected_to training_resource_url(TrainingResource.last)
  end

  test "should show training_resource" do
    get training_resource_url(@training_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_training_resource_url(@training_resource)
    assert_response :success
  end

  test "should update training_resource" do
    patch training_resource_url(@training_resource), params: { training_resource: { author: @training_resource.author, long_description: @training_resource.long_description, short_description: @training_resource.short_description, title: @training_resource.title } }
    assert_redirected_to training_resource_url(@training_resource)
  end

  test "should destroy training_resource" do
    assert_difference("TrainingResource.count", -1) do
      delete training_resource_url(@training_resource)
    end

    assert_redirected_to training_resources_url
  end
end
