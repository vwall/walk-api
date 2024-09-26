# frozen_string_literal: true

Rails.application.config.generators { |g| g.orm :active_record, primary_key_type: :uuid }
