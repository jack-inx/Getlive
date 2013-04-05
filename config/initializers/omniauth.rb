Rails.application.config.middleware.use OmniAuth::Builder do


  if Rails.env.development?

    provider :twitter, 'zDLZZccJ6w0XZB4NAVpmsg', 'WdcAHvzcQPEwWEqeauqlAoNLKn9cGaIIzGz0CzSnWWA', :scope => 'r_fullprofile+r_emailaddress+r_network'
    
    provider :facebook, '332682176854107', '4b76604095e637c980feb388568b2bcf'

    provider :linkedin, "ba21smdibm0g", "a3L2YMR4Nt8YBSe7", :scope => 'r_fullprofile+r_emailaddress+r_network',
      :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "location", "connections"]

  elsif Rails.env.production?
    provider :twitter, 'zDLZZccJ6w0XZB4NAVpmsg', 'WdcAHvzcQPEwWEqeauqlAoNLKn9cGaIIzGz0CzSnWWA', :scope => 'r_fullprofile+r_emailaddress+r_network'

    provider :facebook, '332682176854107', '4b76604095e637c980feb388568b2bcf'

    provider :linkedin, "ba21smdibm0g", "a3L2YMR4Nt8YBSe7", :scope => 'r_fullprofile+r_emailaddress+r_network',
      :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "location", "connections"]

  end

  
end