require 'spec_helper'

print "##############\nCENTOS-6\n############"

describe file('/etc/safe-rm.conf') do
  it {
    should be_file
    should exist
  }
  its(:content) { should match('/dev') }
end

describe file('/usr/bin/safe-rm') do
  it{
    should be_file
    should exist
  }
end
describe command('/usr/bin/safe-rm /bin') do
  its(:stderr) { should match('skipping') }
end
