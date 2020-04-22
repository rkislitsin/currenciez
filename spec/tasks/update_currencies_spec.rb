describe 'update currencies' do

  it 'refresh currencies' do
    Rails.application.load_tasks
    Rake::Task['currencies:refresh'].invoke
    expect(Currency.count).to eq(34)
  end

end