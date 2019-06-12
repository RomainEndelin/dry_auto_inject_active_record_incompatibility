class User < ApplicationRecord
  include DependencyManager::Import[:hello]
end
