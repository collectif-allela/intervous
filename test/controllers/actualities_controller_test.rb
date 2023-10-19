require "test_helper"

class ActualitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actuality = actualities(:one)
  end

  test "should get index" do
    get actualities_url, as: :json
    assert_response :success
  end

  test "should create actuality" do
    assert_difference("Actuality.count") do
      post actualities_url, params: { actuality: { body: @actuality.body, post_id_id: @actuality.post_id_id, summary: @actuality.summary, tag: @actuality.tag, title: @actuality.title, video_url: @actuality.video_url } }, as: :json
    end

    assert_response :created
  end

  test "should show actuality" do
    get actuality_url(@actuality), as: :json
    assert_response :success
  end

  test "should update actuality" do
    patch actuality_url(@actuality), params: { actuality: { body: @actuality.body, post_id_id: @actuality.post_id_id, summary: @actuality.summary, tag: @actuality.tag, title: @actuality.title, video_url: @actuality.video_url } }, as: :json
    assert_response :success
  end

  test "should destroy actuality" do
    assert_difference("Actuality.count", -1) do
      delete actuality_url(@actuality), as: :json
    end

    assert_response :no_content
  end
end
