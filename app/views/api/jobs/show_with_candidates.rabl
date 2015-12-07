object @job
extends('api/jobs/show')

node(:candidates) do |job|
  job.candidates.map(&:id)
end
