from vllm import LLM
from vllm.distributed.parallel_state import destroy_model_parallel

prompts = [
    "Hello, my name is",
    "The president of the United States is",
    "The capital of France is",
    "The future of AI is",
]

# Set "tensor_parallel_size" to the number of GPUs in your job.

llm = LLM(model="/scratch/instructor3/facebook")

outputs = llm.generate(prompts)

for output in outputs:
    prompt = output.prompt
    generated_text = output.outputs[0].text
    print(f"Prompt: {prompt!r}, Generated text: {generated_text!r}")

destroy_model_parallel()
llm.llm_engine.engine_core.shutdown()
