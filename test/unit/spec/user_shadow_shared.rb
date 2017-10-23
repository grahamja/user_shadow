shared_examples_for 'testuser' do |_distro, _version|
  %w(testuser testuser2).each do |user|
    it "creates user #{user}" do
      expect(chef_run).to create_user(user)
    end
  end

  it 'sets shadow attributes for user testuser' do
    expect(chef_run).to modify_shadow_attributes('testuser').with(
      sp_lstchg: '2015-07-01',
      sp_expire: '2030-08-30',
      sp_min: 20,
      sp_max: 60,
      sp_inact: 10,
      sp_warn: 10
    )
  end

  it 'sets shadow attributes for user testuser2' do
    expect(chef_run).to modify_shadow_attributes('testuser2').with(
      sp_expire: '-1',
      sp_min: 0,
      sp_max: 99_999,
      sp_inact: '-1'
    )
  end
end
