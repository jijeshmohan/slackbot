defmodule SlackRtm do
  use Slack

  def handle_connect(slack) do
    IO.puts "Connected as #{slack.me.name}"
  end

  def handle_message(message = %{type: "message"}, slack) do
    IO.puts "Got a message: " <> message.text
    case message.text do
        "hi" -> send_message("hello",message.channel, slack)
        "crash" -> raise "oooops"
        _ -> IO.puts "Not handing " <> message.text
    end
  end


  def handle_message(_,_), do: :ok

  def handle_info({:message, text, channel}, slack) do
    IO.puts "Sending your message, captain!"
    send_message(text, channel, slack)

    {:ok}
  end
  def handle_info(_, _), do: :ok
end