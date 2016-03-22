module Fog
  module DNS
    class AzureRM
      class Zone < Fog::Model
        identity :name
        attribute :id
        attribute :resource_group

        def save
          requires :name
          requires :resource_group
          service.create_zone(resource_group, name)
        end

        def destroy
          service.delete_zone(name, resource_group)
        end
      end
    end
  end
end