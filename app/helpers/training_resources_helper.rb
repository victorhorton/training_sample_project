module TrainingResourcesHelper
  def youtube_iframe(youtube_video_id)
    tag.iframe(width: "560", height: "315", src: "https://www.youtube.com/embed/#{youtube_video_id}", title: "YouTube video player", frameborder: "0", allow: "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share", referrerpolicy: "strict-origin-when-cross-origin", allowfullscreen: true)
  end

  def first_pagination_button(current_number)
    at_minimum = current_number.to_i - 1 < 1

    button_tag(
      "First",
      {
        value: 1,
        disabled: at_minimum,
        'data-action': "click->pagination#setPage",
        class: "py-2 px-4 border rounded border-gray-800 disabled:text-slate-300 disabled:border-slate-300"
      }
    )
  end

  def previous_pagination_button(current_number)
    at_minimum = current_number.to_i - 1 < 1
    next_number = at_minimum ? current_number : current_number.to_i - 1

    button_tag(
      "Previous",
      {
        value: next_number,
        disabled: at_minimum,
        'data-action': "click->pagination#setPage",
        class: "py-2 px-4 border rounded border-gray-800 disabled:text-slate-300 disabled:border-slate-300"
      }
    )
  end

  def next_pagination_button(current_number, max_number)
    at_max = current_number.to_i + 1 > max_number + 1
    next_number = at_max ? current_number : current_number.to_i + 1

    button_tag(
      "Next",
      {
        value: next_number,
        disabled: at_max,
        'data-action': "click->pagination#setPage",
        class: "py-2 px-4 border rounded border-gray-800 disabled:text-slate-300 disabled:border-slate-300"
      }
    )
  end

  def last_pagination_button(current_number, max_number)
    at_max = current_number.to_i + 1 > max_number + 1

    button_tag(
      "Last",
      {
        value: max_number + 1,
        disabled: at_max,
        'data-action': "click->pagination#setPage",
        class: "py-2 px-4 border rounded border-gray-800 disabled:text-slate-300 disabled:border-slate-300"
      }
    )
  end
end
