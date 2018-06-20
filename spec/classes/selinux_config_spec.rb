require 'spec_helper'

describe 'selinux_config', :type => 'class' do

  context "Should enable selinux to enforcing by default" do
    let(:facts) {{
      :osfamily => 'RedHat',
      :operatingsystemmajrelease => '7',
      :operatingsystem => 'CentOS'
    }}

    it do
      should contain_class('selinux').with('mode' => 'enforcing')
    end
  end

  context "Should enable selinux and create modules" do
    let(:facts) {{
      :osfamily => 'RedHat',
      :operatingsystemmajrelease => '7',
      :operatingsystem => 'CentOS',
      :selinux_config_policy => 'strict'
    }}

    let(:params) {{
      :mode => 'permissive',
      :modules => {
        'name1' => {'ensure' => 'present', 'source' => 'path_to_file_1'},
        'name2' => {'ensure' => 'present', 'source' => 'path_to_file_2'}
      }
      }}

    it do
      should contain_class('selinux').with('mode' => 'permissive')
      should contain_selinux__module('name1').with('ensure' => 'present', 'source' => 'path_to_file_1')
      should contain_selinux__module('name2').with('ensure' => 'present', 'source' => 'path_to_file_2')
    end
  end

end