# Apple Neural Engine workspace

Apple Neural Engine projects, forked to `o2alexanderfedin` and cloned here. In each clone, `origin` is your fork and `upstream` is the original. The research write-up is in `apple-neural-engine-training/research/torch_compile_backend/README.md`.

| Dir | Upstream | Lang | Why it's here |
|---|---|---|---|
| `apple-neural-engine-training` | maderix/ANE (+ remote `zpeng11` = zpeng11/ANE) | ObjC | Baseline: `_ANEInMemoryModel` compile/load/eval, hand-written MIL, training on the ANE. `zpeng11` holds the multi-input experiments (issue #56). |
| `ANEForge` | sbryngelson/ANEForge | Python | Python graph → MIL text, e5rt dispatch, per-chip op catalog plus a sweep of all 166 MIL ops, training on the ANE. Candidate lowering target. |
| `Orion` | mechramc/Orion | ObjC | 27-op graph IR → MIL emitter, ANE constraint list. Its "delta compilation" is not backed by its own code. |
| `ane-train` | imperatormk/ane-train | C | M1 training with weights as runtime inputs, plus an M1 constraints cheatsheet. **No license.** |
| `YuE-Studio` | tonywestonuk/YuE-Studio | Python/ObjC | Direct `ANECCompile`, saved `.hwx` loading, compiler flags (`docs/apple-silicon.md`, `tools/ane/research/`). |
| `silicon-ledger-public` | 4rg0naut/silicon-ledger-public | Python | Measured experiments: EXP-041 multi-input, EXP-042 compile cost, EXP-035 chaining. |
| `ane-infer` | thebasedcapital/ane-infer | Rust/ObjC | `docs/ane-internals.md`: direct eval, multi-procedure MIL, chaining attempts. |
| `Espresso` | christopherkarani/Espresso | Swift | Transformer inference on the ANE, kernel fusion patterns. |
| `ANE-LM` | johnmai-dev/ANE-LM | C++ | LLM inference on the ANE. |
| `Apple-Neural-Engine-Microarchitecture-Study-M6` | 751K/… | Python | M6 microarchitecture study (Core ML only), raw data. |
| `neural-engine` | hollance/neural-engine | docs | Community knowledge base on Core ML → ANE behavior. |
| `ml-ane-transformers` | apple-aiml-research/ml-ane-transformers | Python | Apple's reference for transformers on the ANE (`[B,C,1,S]` layout, conv instead of linear). |

Update all: `for d in */; do git -C "$d" fetch --all -q; done`
