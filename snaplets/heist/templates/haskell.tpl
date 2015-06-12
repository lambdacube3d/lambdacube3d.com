<apply template="base">
<link rel="shortcut icon" href="http://lambdacube3d.com/lcicon.ico" />
<ul>
<li><a href="#overview">Overview</a><ul>
<li><a href="#haskell98-language-features">Haskell98 language features</a></li>
<li><a href="#extentions-compared-to-haskell98">Extentions compared to Haskell98</a><ul>
<li><a href="#registered-extensions">Registered extensions</a></li>
<li><a href="#other-extensions">Other extensions</a></li>
</ul></li>
</ul></li>
<li><a href="#prelude">Prelude</a></li>
<li><a href="#row-polymorphism">Row polymorphism</a></li>
<li><a href="#swizzling">Swizzling</a></li>
<li><a href="#compositional-typing">Compositional typing</a></li>
</ul>
<h1 id="overview">Overview</h1>
<p>LambdaCube 3D is specified as <a href="https://www.haskell.org/onlinereport/">Haskell98</a> plus various language extensions.</p>
<h2 id="haskell98-language-features">Haskell98 language features</h2>
<ul>
<li>patterns
<ul>
<li>variable, constructor, wildcard – <em>Done</em></li>
<li>tuple, list – <em>Done</em></li>
<li>at-pattern – <em>Done</em></li>
<li>irrefutable pattern – <em>TODO</em></li>
</ul></li>
<li>expressions
<ul>
<li>variable, constructor, application, lambda, case, if – <em>Done</em></li>
<li>let – <em>WIP</em></li>
<li>type signature – <em>Done</em></li>
<li>tuples, lists – <em>Done</em></li>
<li>list comprehensions – <em>Done</em></li>
<li>dot-dot expressions – <em>WIP</em></li>
<li>do syntax – <em>TODO</em></li>
<li>operators, fixity declarations – <em>Done</em></li>
</ul></li>
<li>definitions
<ul>
<li>value definition, function, function alternative, guard, where-block – <em>Done</em></li>
<li>mutual recursion – <em>TODO</em></li>
<li>type signature – <em>WIP</em></li>
<li>data declarations – <em>Done</em></li>
<li>newtype declarations – <em>TODO</em></li>
<li>type synonyms – <em>TODO</em></li>
<li>type classes – <em>WIP</em>
<ul>
<li>defaulting – <em>TODO</em></li>
<li>deriving – <em>TODO</em></li>
</ul></li>
</ul></li>
<li>modules
<ul>
<li>module imports and export lists – <em>WIP</em></li>
</ul></li>
</ul>
<p>There are some diversions from Haskell98. Our plan is to keep this list very short.</p>
<ul>
<li><a href="#prelude">Different Prelude</a> – <em>WIP</em></li>
<li>Definitions should be ordered bottom-up – *</li>
</ul>
<table>
<thead>
<tr class="header">
<th align="left">Notes</th>
<th align="left"></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">*</td>
<td align="left">Not essential restriction (will be lifted)</td>
</tr>
<tr class="even">
<td align="left"><em>Done</em></td>
<td align="left">Done</td>
</tr>
<tr class="odd">
<td align="left"><em>WIP</em></td>
<td align="left">Work In Progress</td>
</tr>
<tr class="even">
<td align="left"><em>TODO</em></td>
<td align="left">We think we know how to do this, needs time</td>
</tr>
</tbody>
</table>
<h2 id="extentions-compared-to-haskell98">Extentions compared to Haskell98</h2>
<p>These extensions are automatically enabled.</p>
<h3 id="registered-extensions">Registered extensions</h3>
<ul>
<li><a href="https://ghc.haskell.org/trac/haskell-prime/wiki/NoMonomorphismRestriction"><code>NoMonomorphismRestriction</code></a> – <em>Done</em></li>
<li><a href="https://ghc.haskell.org/trac/haskell-prime/wiki/NoNPlusKPatterns"><code>NoNPlusKPatterns</code></a> – <em>Done</em></li>
<li><a href="https://ghc.haskell.org/trac/ghc/wiki/TypeApplication"><code>TypeApplication</code></a> – <em>Done</em></li>
<li><code>KindSignatures</code> – <em>Done</em></li>
<li><a href="https://ghc.haskell.org/trac/haskell-prime/wiki/EmptyDataDecls"><code>EmptyDataDecls</code></a> – <em>TODO</em></li>
<li><a href="https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/kind-polymorphism-and-promotion.html"><code>PolyKinds</code> &amp; <code>DataKinds</code></a> – <em>WIP</em></li>
<li><a href="https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/data-type-extensions.html#gadt"><code>GADTs</code></a> (includes <code>ExistentialQuantification</code>) – <em>WIP</em></li>
<li><a href="https://wiki.haskell.org/GHC/Type_families"><code>TypeFamilies</code></a> – <em>WIP</em></li>
<li><a href="https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/partial-type-signatures.html"><code>PartialTypeSignatures</code></a> – <em>WIP</em></li>
<li><a href="https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/other-type-extensions.html#scoped-type-variables"><code>ScopedTypeVariables</code></a> – <em>TODO</em></li>
<li><a href="https://ghc.haskell.org/trac/haskell-prime/wiki/RankNTypes"><code>RankNTypes</code></a> – <em>TODO</em></li>
<li><a href="https://wiki.haskell.org/GHC/Typed_holes">Typed holes</a> – <em>TODO</em></li>
<li><a href="https://ghc.haskell.org/trac/haskell-prime/wiki/LambdaCase"><code>LambdaCase</code></a> – <em>TODO</em></li>
<li><code>LANGUAGE</code> pragmas
<ul>
<li><code>NoImplicitPrelude</code> – <em>Done</em></li>
</ul></li>
</ul>
<h3 id="other-extensions">Other extensions</h3>
<ul>
<li><a href="#row-polymorphism">Raw polymorphism</a> – <em>Done</em></li>
<li><a href="#swizzling">Swizzling</a> – <em>WIP</em></li>
<li><code>ImplicitParams</code> – <em>WIP</em></li>
<li>Compositional typing – <em>Done</em></li>
<li>Type error specialisation – <em>TODO</em></li>
</ul>
<h1 id="prelude">Prelude</h1>
<p><a href="https://github.com/csabahruska/lc-dsl/blob/master/lambdacube-dsl/tests/accept/Prelude.lc">The current Prelude</a></p>
<h1 id="row-polymorphism">Row polymorphism</h1>
<p>A.k.a. structural records.<br />Row polymorphism is implemented following <a href="http://ekmett.github.io/presentations/Functional%20Reporting.pdf">Edward Kmett’s presentation on Ermine</a>.</p>
<div class="sourceCode"><pre class="sourceCode haskell"><code class="sourceCode haskell">v1 <span class="fu">=</span> {x<span class="fu">:</span> <span class="fl">1.0</span>, y<span class="fu">:</span> <span class="fl">2.0</span>, z<span class="fu">:</span> <span class="fl">3.0</span>}
v2 <span class="fu">=</span> {x<span class="fu">:</span> <span class="fl">1.0</span>, y<span class="fu">:</span> <span class="fl">2.0</span>, z<span class="fu">:</span> <span class="fl">3.0</span>, a<span class="fu">:</span> <span class="fl">4.0</span>}

f v <span class="fu">=</span> v<span class="fu">.</span>x <span class="fu">+!</span> v<span class="fu">.</span>y

r <span class="fu">=</span> f v1 <span class="fu">+!</span> f v2    <span class="co">-- this is valid</span></code></pre></div>
<h1 id="swizzling">Swizzling</h1>
<p>Swizzling means rearranging the elements of a vector.<a href="#fn1" class="footnoteRef" id="fnref1"><sup>1</sup></a></p>
<div class="sourceCode"><pre class="sourceCode haskell"><code class="sourceCode haskell">(<span class="dt">V3</span> <span class="fl">1.0</span> <span class="fl">2.0</span> <span class="fl">3.0</span>)<span class="fu">%</span>xxzy   <span class="fu">==</span>   <span class="dt">V4</span> <span class="fl">1.0</span> <span class="fl">1.0</span> <span class="fl">3.0</span> <span class="fl">2.0</span></code></pre></div>
<p>The letters <code>x</code>, <code>y</code>, <code>z</code> and <code>w</code> refers to the 1st, 2nd, 3rd and 4th element of a record, respectively.<br />It is also possible to use the letters <code>r</code>, <code>g</code>, <code>b</code> and <code>a</code> instead of <code>x</code>, <code>y</code>, <code>z</code> and <code>w</code>.</p>
<h1 id="compositional-typing">Compositional typing</h1>
<p>Compositional typing improves error messages. Compositional typing can be seen as a language extension if we suppose that a language description provide information about ill-typed programs too.</p>
<p>Gergő Érdi’s master thesis: <a href="http://gergo.erdi.hu/projects/tandoori/Tandoori-Compositional-Typeclass.pdf">Compositional Type Checking for Hindley-Milner Type Systems with Ad-hoc Polymorphism</a></p>
<div class="footnotes">
<hr />
<ol>
<li id="fn1"><p><a href="http://en.wikipedia.org/wiki/Swizzling_%28computer_graphics%29">Wikipedia article</a><a href="#fnref1">↩</a></p></li>
</ol>
</div>
</apply>

