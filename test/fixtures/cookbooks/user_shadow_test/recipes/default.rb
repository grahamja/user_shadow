%w(testuser testuser2).each do |u|
  user u

  user_shadow u do
    sp_lstchg '2015-07-01'
    sp_expire '2030-08-30'
    sp_min 20
    sp_max 60
    sp_inact 10
    sp_warn 10
  end
end

user_shadow 'testuser2' do # so we can test going back to defaults.
  sp_expire '-1'
  sp_inact '-1'
  sp_max 99999
  sp_min 0
end
