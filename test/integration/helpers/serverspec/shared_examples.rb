shared_examples_for 'testuser' do
  %w(testuser testuser2).each do |u|
    describe user(u) do
      it { should exist }
    end
  end

  describe command('chage -l testuser') do
    its(:exit_status) { should eq 0 }
    [
      'Last password change[[:space:]]+: Jul 01, 2015',
      'Password expires[[:space:]]+: Aug 30, 2015',
      'Account expires[[:space:]]+: Aug 30, 2030',
      'Minimum number of days between password change[[:space:]]+: 20',
      'Maximum number of days between password change[[:space:]]+: 60',
      'Number of days of warning before password expires[[:space:]]+: 10',
    ].each do |rex|
      its(:stdout) { should match(/#{rex}/) }
    end
  end

  describe command('chage -l testuser2') do
    its(:exit_status) { should eq 0 }
    [
      'Password expires[[:space:]]+: never',
      'Password inactive[[:space:]]+: never',
      'Account expires[[:space:]]+: never',
      'Minimum number of days between password change[[:space:]]+: 0',
      'Maximum number of days between password change[[:space:]]+: 99999',
    ].each do |rex|
      its(:stdout) { should match(/#{rex}/) }
    end
  end
end
