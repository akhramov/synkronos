require 'spec_helper'

shared_examples 'file synchronizator' do |actions|
  it 'moves a file from src to dest' do 
    expect(File).not_to exist("#{dest}/file")

    actions.call(src, dest)
    expect(File).to exist("#{dest}/file")
    expect(File.read("#{dest}/file")).to include('Under the spreading chestnut tree')
  end
  
  it 'changes a file in dest' do
    open("#{src}/file", 'a+') { |file| file.write('I sold you and you sold me') }
    actions.call(src, dest)
    expect(File.read("#{dest}/file")).to include('I sold you and you sold me')
  end
  
  it 'removes a file from dest' do
    FileUtils.remove_entry_secure("#{src}/file")
    actions.call(src, dest)
    expect(File).not_to exist("#{dest}/file")
  end
end

describe Synkronos::Rsync do
  let(:dest) { Dir.mktmpdir }
  let(:src) do
    dir = Dir.mktmpdir
    open("#{dir}/file", 'w') { |file| file.write('Under the spreading chestnut tree') }
    dir
  end
      
  context 'without ssh' do
    it_behaves_like 'file synchronizator', ->(src, dest) {Synkronos::Rsync.sync(src, dest)}
  end
  
  context 'with ssh' do
    context 'to client' do
      it_behaves_like 'file synchronizator', ->(src, dest) {Synkronos::Rsync.sync(src, 'localhost:' + dest, true)}
    end

    context 'from server' do
      it_behaves_like 'file synchronizator', ->(src, dest) {Synkronos::Rsync.sync('localhost:' + src, dest, true)}
    end
  end
end
