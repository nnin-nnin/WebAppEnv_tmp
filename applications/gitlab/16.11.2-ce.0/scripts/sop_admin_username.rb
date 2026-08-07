# Allow the requested initial administrator username. GitLab's default route
# reservation includes /admin, while this all-in-one environment uses the
# built-in Administrator account rather than a user namespace at that path.
if defined?(Gitlab::PathRegex::TOP_LEVEL_ROUTES) && Gitlab::PathRegex::TOP_LEVEL_ROUTES.include?('admin')
  routes = Gitlab::PathRegex::TOP_LEVEL_ROUTES - ['admin']
  Gitlab::PathRegex.send(:remove_const, :TOP_LEVEL_ROUTES)
  Gitlab::PathRegex.const_set(:TOP_LEVEL_ROUTES, routes.freeze)
end

module SopAdminUsernameValidation
  def valid?(*args)
    result = super
    if self.class.name == 'User' && respond_to?(:username) && username == 'admin'
      errors.delete(:username)
      result = errors.empty?
    end
    result
  end
end

ActiveRecord::Base.prepend(SopAdminUsernameValidation) if defined?(ActiveRecord::Base)
