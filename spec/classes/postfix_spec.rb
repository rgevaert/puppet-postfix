require 'spec_helper'

describe 'postfix' do
  let(:params) { {:root_alias => 'myroot@domain.com'} }
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "alist class without any parameters" do
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('postfix') }
        end
      end
    end
  end

end
