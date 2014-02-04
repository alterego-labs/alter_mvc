module AlterMvc
  class BasicUseCase
    class << self

      def execute(*args)
        raise 'Must be implemented!'
      end

    end
  end
end