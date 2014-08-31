require 'spec_helper'

describe 'digest', :type => :class do
  let(:title) { 'digest::configure' }

  it { should contain_file('/etc/apache2/htpasswd')
    .with_ensure('present')
    .with_owner('www-data')
    .with_group('www-data')
    .with_mode('0600')
    .that_comes_before('Apache::loadmodule[auth_digest]')
  }

  it { should contain_file('/etc/apache2/conf-available/digest.conf')
    .with_ensure('present')
    .with_owner('www-data')
    .with_group('www-data')
    .with_mode('0644')
    .that_comes_before('Apache::loadconf[digest]')
  }
end
