object @job
extends('api/jobs/show')

node(:candidates) do |job|
  partial('api/candidates/show', object: job.candidates)
end
