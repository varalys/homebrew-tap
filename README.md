# Varalys Homebrew Tap

Homebrew formulae for Varalys projects.

## Installation

First, add the Varalys tap (third-party formula repository):

```
 brew tap varalys/tap
```
You only need to do this once. After tapping, you can install any formula from this repo.

Alternatively, install directly without tapping first:
```
brew install varalys/tap/redactyl
```
Available Formulae

### **Redactyl**

Deep artifact scanner for secrets in containers, Helm charts, and K8s manifests.
```
brew install varalys/tap/redactyl
```
Usage:
```
redactyl scan --helm --k8s -p ./my-project
```
### **Lore**

Captures AI coding sessions and links them to git commits.
```
brew install varalys/tap/lore
```
To run the background daemon:
```
brew services start lore
```
More Information

- https://github.com/varalys/redactyl
- https://github.com/varalys/lore
- https://github.com/varalys
