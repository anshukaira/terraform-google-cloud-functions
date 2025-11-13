/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "function_uri" {
  description = "URI of the Cloud Function (Gen 2)"
  value       = google_cloudfunctions2_function.function.service_config[0].uri
}

output "function_name" {
  description = "Name of the Cloud Function (Gen 2)"
  value       = var.function_name
}

output "apphub_service_uri" {
  value = {
    service_uri = "//cloudfunctions.googleapis.com/projects/${var.project_id}/locations/${var.location}/functions/${var.function_name}"
    service_id  = substr("${var.function_name}-${md5("google-cloud-function-${var.location}-${var.project_id}")}", 0, 63)
    location    = var.location
  }
  description = "Service URI in CAIS style to be used by Apphub."
}
