require_relative '../corrector'

describe Corrector do
  context 'should reduce the length of the name if its longer than 10' do
    it 'should return Akinlade t' do
      name = Corrector.new
      expect(name.correct_name('Akinlade Temitope')).to eql 'Akinlade t'
    end
  end
end
