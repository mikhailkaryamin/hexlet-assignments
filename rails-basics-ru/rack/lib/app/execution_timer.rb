# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    time_before = current_ticks
    status, headers, body = @app.call(env)
    time_delta = current_ticks - time_before

    body << time_delta

    [status, headers, [body.join("\n")]]
  end

  def current_ticks
    (Time.now.to_f * 1e6).to_i
  end
end
