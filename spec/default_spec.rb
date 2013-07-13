require 'chefspec'

describe 'ldapknife::default' do
  
  # Initiate ChefSpec::ChefRunner.
  let (:chef_run) { ChefSpec::ChefRunner.new.converge('ldapknife::default') }

  # perl::default recipe should be included.
  it 'should include the perl recipe' do
    chef_run.should include_recipe 'perl'
  end

  # /usr/local/bin/ldapknife.pl should be exist.
  it 'creates /usr/local/bin/ldapknife.pl' do
    chef_run = ChefSpec::ChefRunner.new
    chef_run.converge 'ldapknife::default'
    expect(chef_run).to create_cookbook_file '/usr/local/bin/ldapknife.pl'
    file = chef_run.cookbook_file('/usr/local/bin/ldapknife.pl')
    expect(file).to be_owned_by('root', 'root')
    expect(file.mode).to eq("0755")
  end
   
end
