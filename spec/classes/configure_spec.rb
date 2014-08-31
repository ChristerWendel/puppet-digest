require 'spec_helper'

describe 'digest', :type => :class do
  let(:title) { 'digest::configure' }

  it { should contain_file('/etc/apache2/htpasswd')
    .with_ensure('present')
  }

  it { should contain_file('/etc/apache2/conf-available/digest.conf')
    .with_ensure('present')
  }
end
