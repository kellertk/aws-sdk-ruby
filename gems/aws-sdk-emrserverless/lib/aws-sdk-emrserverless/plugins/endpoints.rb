# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE


module Aws::EMRServerless
  module Plugins
    class Endpoints < Seahorse::Client::Plugin
      option(
        :endpoint_provider,
        doc_type: 'Aws::EMRServerless::EndpointProvider',
        docstring: 'The endpoint provider used to resolve endpoints. Any '\
                   'object that responds to `#resolve_endpoint(parameters)` '\
                   'where `parameters` is a Struct similar to '\
                   '`Aws::EMRServerless::EndpointParameters`'
      ) do |cfg|
        Aws::EMRServerless::EndpointProvider.new
      end

      # @api private
      class Handler < Seahorse::Client::Handler
        def call(context)
          unless context[:discovered_endpoint]
            params = parameters_for_operation(context)
            endpoint = context.config.endpoint_provider.resolve_endpoint(params)

            context.http_request.endpoint = endpoint.url
            apply_endpoint_headers(context, endpoint.headers)

            context[:endpoint_params] = params
            context[:endpoint_properties] = endpoint.properties
          end

          context[:auth_scheme] =
            Aws::Endpoints.resolve_auth_scheme(context, endpoint)

          @handler.call(context)
        end

        private

        def apply_endpoint_headers(context, headers)
          headers.each do |key, values|
            value = values
              .compact
              .map { |s| Seahorse::Util.escape_header_list_string(s.to_s) }
              .join(',')

            context.http_request.headers[key] = value
          end
        end

        def parameters_for_operation(context)
          case context.operation_name
          when :cancel_job_run
            Aws::EMRServerless::Endpoints::CancelJobRun.build(context)
          when :create_application
            Aws::EMRServerless::Endpoints::CreateApplication.build(context)
          when :delete_application
            Aws::EMRServerless::Endpoints::DeleteApplication.build(context)
          when :get_application
            Aws::EMRServerless::Endpoints::GetApplication.build(context)
          when :get_dashboard_for_job_run
            Aws::EMRServerless::Endpoints::GetDashboardForJobRun.build(context)
          when :get_job_run
            Aws::EMRServerless::Endpoints::GetJobRun.build(context)
          when :list_applications
            Aws::EMRServerless::Endpoints::ListApplications.build(context)
          when :list_job_runs
            Aws::EMRServerless::Endpoints::ListJobRuns.build(context)
          when :list_tags_for_resource
            Aws::EMRServerless::Endpoints::ListTagsForResource.build(context)
          when :start_application
            Aws::EMRServerless::Endpoints::StartApplication.build(context)
          when :start_job_run
            Aws::EMRServerless::Endpoints::StartJobRun.build(context)
          when :stop_application
            Aws::EMRServerless::Endpoints::StopApplication.build(context)
          when :tag_resource
            Aws::EMRServerless::Endpoints::TagResource.build(context)
          when :untag_resource
            Aws::EMRServerless::Endpoints::UntagResource.build(context)
          when :update_application
            Aws::EMRServerless::Endpoints::UpdateApplication.build(context)
          end
        end
      end

      def add_handlers(handlers, _config)
        handlers.add(Handler, step: :build, priority: 75)
      end
    end
  end
end
