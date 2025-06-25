extends CPUParticles2D   # or GPUParticles2D

func _ready() -> void:
	one_shot = true           # safety if you forget in Inspector
	emitting = true           # start immediately
	connect("finished", self.queue_free)
