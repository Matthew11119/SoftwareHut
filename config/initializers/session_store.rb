Rails.application.config.session_store :active_record_store, key: (Rails.env.production? ? '_deployment-lab_session_id' : (Rails.env.demo? ? '_deployment-lab_demo_session_id' : '_deployment-lab_dev_session_id')),
                                                             secure: (Rails.env.demo? || Rails.env.production?),
                                                             httponly: true
