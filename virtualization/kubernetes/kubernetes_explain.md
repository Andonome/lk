---
title: "Kubernetes Docs"
tags: [ "virtualization", "kubernetes", "WTFM", "hosts", "DNS" ]
requires: [ "minikube_setup" ]
---

`kubectl` provides easy high-level overviews:

```sh
kubectl config view
kubectl cluster-info
```

Unfortunately, the documentation commands work less well.

# Kube-Explain

The `kubectl explain` resources cannot use tab-completion.
But you can find the same resources listed with `api-resources`, and use a fuzzy-finder, to get the same effect.

```sh
t="$(kubectl api-resources  | fzy | gawk '{print $1}')"
kubectl explain ${t}
```

The documentation is in a classic style, which could only be improved by deletion.
Take this fragment from `kubectl explain namespaces`:

```
DESCRIPTION:
    Namespace provides a scope for Names. Use of multiple namespaces is
    optional.
```

- Sentence 1: A 'name-space' is a space for names.
- Sentence 2: If you create a namespace, you will not receive an error due to not having a second namespace.  This is also the case for deployments, variables, and files which begin with the letter 'P', but the writer was being paid per word.

Continuing...

```
  metadata	<ObjectMeta>
    Standard object's metadata. More info:
    https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
```

So a namespace has metadata, which has something in diamond-brackets called `ObjectMeta`.
We should understand this as 'normal metadata for an object', and the author promises us more information.
But only a fool would trust that link, as the author's a hack, without even the flimsy excuse of being left alone with ChatGPT (the docs existed before LLMs became uncool).

Completing this morality tale, entitled '*Why Nobody Reads the Docs*', we arrive at the end of Kubernetes' namespace documentation:

```
  status	<NamespaceStatus>
    Status describes the current status of a Namespace. More info:
    https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
```

Of course this is wrong.
The sentence should read:

```
'Status' describes the current status of a Namespace.
```

