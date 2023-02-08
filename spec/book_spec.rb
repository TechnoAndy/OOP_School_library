require_relative '../book'

describe Book do
  before :all do
    @book = Book.new('Redeeming Love', 'Francine Rivers')
  end

  context 'Unit test for Book' do
    it 'should have a title Redeeming Love' do
      title = @book.title
      expect(title).to eq 'Redeeming Love'
    end

    it 'should havean author Francine Rivers' do
      author = @book.author
      expect(author).to eq 'Francine Rivers'
    end
  end
end
