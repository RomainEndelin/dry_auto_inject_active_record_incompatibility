module DependencyManager
  Container = Dry::Container.new

  Container.register(:hello) { 'world' }

  Import = Dry::AutoInject(Container)
end
