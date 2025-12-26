# SMARTI Technical Standards and Conventions

Comprehensive reference for developers contributing to or extending SMARTI.

---

## Table of Contents

- [Code Style](#code-style)
- [File Organization](#file-organization)
- [Naming Conventions](#naming-conventions)
- [Version Control](#version-control)
- [Documentation](#documentation)
- [Error Handling](#error-handling)
- [Internationalization](#internationalization)
- [Security](#security)
- [Logging System](#logging-system)

---

## Code Style

### Shell Script Standards

#### Shebang

All executable scripts must use portable shebang:

#### Error Handling

Mandatory error handling configuration:

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-6hf33hspo" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(255, 203, 139)">set</span><span> </span><span class="token parameter" style="color:rgb(214, 222, 235)">-euTo</span><span> pipefail
</span></code></pre></div>

- `-e`: Exit immediately on error
- `-u`: Exit on undefined variable usage
- `-o pipefail`: Pipe failures propagate exit code
- `-T`: Enable trap inheritance for modular scripts

#### Script Header Template

All scripts in `bins/` must include standardized header:

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-tnpniixfu" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token shebang" style="color:rgb(214, 222, 235);font-weight:bold">#!/usr/bin/env bash</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#-----------------------------------------------------------------------------------------</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Script Name    : script_name.sh</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Description    : Brief description of script purpose</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Author         : Sandro Dias (gitdias)</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Author Contact : https://github.com/gitdias</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Repository     : https://github.com/gitdias/SMARTI</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># License        : MIT License</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Version        : v01.00.00_u2025-12-26</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Creation Date  : 2025-12-26</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Last Modified  : 2025-12-26</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#-----------------------------------------------------------------------------------------</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Usage: script_name.sh [OPTIONS]</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Options:</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   -h, --help       Display this help message</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   -v, --version    Display version information</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   -i, --info       Display detailed script information</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   -l, --language   Set language (us|pt_BR)</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   -y, --yes        Auto-confirm all prompts</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   -s, --silent     Suppress non-error output</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Examples:</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   script_name.sh --help</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   script_name.sh --version</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   script_name.sh --language pt_BR</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#-----------------------------------------------------------------------------------------</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Strict error handling with trap inheritance</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">set</span><span> </span><span class="token parameter" style="color:rgb(214, 222, 235)">-euTo</span><span> pipefail
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Global variables</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">SCRIPT_NAME</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">$(</span><span class="token" style="color:rgb(130, 170, 255)">basename</span><span class="token" style="color:rgb(214, 222, 235)"> </span><span class="token" style="color:rgb(214, 222, 235)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${</span><span class="token environment" style="color:rgb(130, 170, 255)">BASH_SOURCE</span><span class="token" style="color:rgb(199, 146, 234)">[</span><span class="token" style="color:rgb(214, 222, 235)">0</span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(214, 222, 235)">}</span><span class="token" style="color:rgb(214, 222, 235)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">)</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">SCRIPT_DIR</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;$(cd &quot;</span><span class="token" style="color:rgb(214, 222, 235)">$(</span><span class="token" style="color:rgb(130, 170, 255)">dirname</span><span class="token" style="color:rgb(214, 222, 235)"> </span><span class="token" style="color:rgb(214, 222, 235)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${</span><span class="token environment" style="color:rgb(130, 170, 255)">BASH_SOURCE</span><span class="token" style="color:rgb(199, 146, 234)">[</span><span class="token" style="color:rgb(214, 222, 235)">0</span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(214, 222, 235)">}</span><span class="token" style="color:rgb(214, 222, 235)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">)</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">&amp;&amp;</span><span> </span><span class="token" style="color:rgb(255, 203, 139)">pwd</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span class="token" style="color:rgb(173, 219, 103)">&quot;
</span><span class="token" style="color:rgb(173, 219, 103)">readonly SCRIPT_VERSION=&quot;</span><span>v01.00.00_u2025-12-26&quot;
</span></code></pre></div>

#### Library Header Template

Libraries in `libs/` use slightly different header:

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-8rd7j6nf0" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token shebang" style="color:rgb(214, 222, 235);font-weight:bold">#!/usr/bin/env bash</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#-----------------------------------------------------------------------------------------</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Library Name   : library_name.lib.sh</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Description    : Brief description of library purpose</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Author         : Sandro Dias (gitdias)</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Author Contact : https://github.com/gitdias</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Repository     : https://github.com/gitdias/SMARTI</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># License        : MIT License</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Version        : v01.00.00_u2025-12-26</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Creation Date  : 2025-12-26</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Last Modified  : 2025-12-26</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#-----------------------------------------------------------------------------------------</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Usage: source /opt/smarti/libs/library_name.lib.sh</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Functions:</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   function_name()  - Brief description of function</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Dependencies:</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   - bash 4.0+</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   - tput (optional)</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Examples:</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   source /opt/smarti/libs/library_name.lib.sh</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#   function_name &quot;argument&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#-----------------------------------------------------------------------------------------</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Prevent direct execution</span><span>
</span><span></span><span class="token" style="color:rgb(127, 219, 202)">if</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">[</span><span class="token" style="color:rgb(199, 146, 234)">[</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${</span><span class="token environment" style="color:rgb(130, 170, 255)">BASH_SOURCE</span><span class="token" style="color:rgb(199, 146, 234)">[</span><span class="token" style="color:rgb(214, 222, 235)">0</span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(214, 222, 235)">}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">==</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${0}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(199, 146, 234)">;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">then</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Error: This is a library file and should not be executed directly.&quot;</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Usage: source </span><span class="token" style="color:rgb(214, 222, 235)">${</span><span class="token environment" style="color:rgb(130, 170, 255)">BASH_SOURCE</span><span class="token" style="color:rgb(199, 146, 234)">[</span><span class="token" style="color:rgb(214, 222, 235)">0</span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(214, 222, 235)">}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">exit</span><span> </span><span class="token" style="color:rgb(247, 140, 108)">1</span><span>
</span><span></span><span class="token" style="color:rgb(127, 219, 202)">fi</span><span>
</span></code></pre></div>

#### Configuration File Format

Configuration files in `conf/` use KEY=VALUE format:

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-6va03o8o6" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#-----------------------------------------------------------------------------------------</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># SMARTI - Configuration File Name</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#-----------------------------------------------------------------------------------------</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Brief description of configuration purpose</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Usage: source /opt/smarti/conf/file_name.conf</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic">#-----------------------------------------------------------------------------------------</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Comments use hash symbol</span><span>
</span><span></span><span class="token assign-left" style="color:rgb(214, 222, 235)">KEY_NAME</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;value&quot;</span><span>
</span><span></span><span class="token assign-left" style="color:rgb(214, 222, 235)">ANOTHER_KEY</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;another_value&quot;</span><span>
</span></code></pre></div>

#### Code Comments

- **Function comments:** English only
- **User-facing messages:** i18n support required
- **Inline comments:** Use `#` for single-line
- **Block comments:** Use `#` prefix for each line

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-idgls806u" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Good: Clear, concise English comment</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Calculate total disk usage in megabytes</span><span>
</span><span></span><span class="token function-name" style="color:rgb(130, 170, 255)">calculate_disk_usage</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">path</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${1}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span>    </span><span class="token" style="color:rgb(130, 170, 255)">du</span><span> </span><span class="token parameter" style="color:rgb(214, 222, 235)">-sm</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${path}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">|</span><span> </span><span class="token" style="color:rgb(130, 170, 255)">awk</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&#x27;{print $1}&#x27;</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Bad: Vague comment without context</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Do stuff</span><span>
</span><span></span><span class="token function-name" style="color:rgb(130, 170, 255)">do_something</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># ...</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span></code></pre></div>

---

## File Organization

### Directory Structure

/opt/smarti/
        ├── bins/           # Executable scripts
        ├── libs/           # Reusable libraries
        ├── conf/           # Configuration files (.conf)
        ├── docs/           # Documentation (.md)
        ├── i18n/           # Translation files (.lang)
        ├── logs/           # Log files (.log)
        ├── bkps/           # Backup archives (.tar.zst)
        ├── mans/           # Manual pages
        └── .gitignore      # Git ignore rules

### File Naming Conventions

#### Scripts (bins/)
- Format: `script_name.sh`
- Lowercase with underscores
- Descriptive, action-oriented names
- Examples: `system_audit.sh`, `backup_manager.sh`

#### Libraries (libs/)
- Format: `function_name.lib.sh`
- Lowercase with underscores
- Must end with `.lib.sh`
- Examples: `log.lib.sh`, `detect_distro.lib.sh`

#### Configuration (conf/)
- Format: `purpose.conf`
- Lowercase with underscores
- Must end with `.conf`
- Examples: `colors.conf`, `distros.conf`

#### Documentation (docs/)
- Format: `DOCUMENT_NAME.md`
- Uppercase for standard docs
- Examples: `README.md`, `CHANGELOG.md`, `STANDARDS.md`

#### Translation (i18n/)
- Format: `locale.lang`
- ISO 639-1 language codes
- Examples: `us.lang`, `pt_BR.lang`, `es_ES.lang`

#### Logs (logs/)
- Format: `script_name.log` or `category.log`
- Lowercase with underscores
- Examples: `events.log`, `system_audit.log`

---

## Naming Conventions

### Variables

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-1g362yvts" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Constants: UPPERCASE with underscores</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">MAX_RETRIES</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(247, 140, 108)">3</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">DEFAULT_TIMEOUT</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(247, 140, 108)">30</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Global variables: UPPERCASE with underscores</span><span>
</span><span></span><span class="token assign-left" style="color:rgb(214, 222, 235)">CURRENT_USER</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;&quot;</span><span>
</span><span></span><span class="token assign-left" style="color:rgb(214, 222, 235)">SYSTEM_DISTRO</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;&quot;</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Local variables: lowercase with underscores</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">temp_file</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">result_count</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(247, 140, 108)">0</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Environment variables: Prefix with SMARTI_</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">export</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">SMARTI_CONFIG_DIR</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;/opt/smarti/conf&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">export</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">SMARTI_LOG_LEVEL</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;INFO&quot;</span><span>
</span></code></pre></div>

### Functions

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-z9m84hya0" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Format: verb_noun() or action_description()</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Use lowercase with underscores</span><span>
</span>
<span></span><span class="token function-name" style="color:rgb(130, 170, 255)">check_dependencies</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># ...</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span>
<span></span><span class="token function-name" style="color:rgb(130, 170, 255)">install_package</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">package</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${1}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span>    </span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># ...</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span>
<span></span><span class="token function-name" style="color:rgb(130, 170, 255)">generate_report</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># ...</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Prefix with underscore for internal/private functions</span><span>
</span><span></span><span class="token function-name" style="color:rgb(130, 170, 255)">_internal_helper</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># ...</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span></code></pre></div>

---

## Version Control

### Semantic Versioning

Format: `vMAJOR.MINOR.PATCH_uYYYY-MM-DD`

- **MAJOR:** Breaking changes (v02.00.00)
- **MINOR:** New features, backward compatible (v01.01.00)
- **PATCH:** Bug fixes, minor improvements (v01.00.01)
- **Update Date:** Date of last modification (u2025-12-26)

#### Examples:
- `v01.00.00_u2025-12-26` - Initial release
- `v01.01.00_u2025-12-27` - New feature added
- `v01.01.01_u2025-12-28` - Bug fix applied
- `v02.00.00_u2026-01-15` - Breaking change introduced

#### Version Files:
- `conf/version.conf` - Locally installed version
- `conf/current_version.conf` - Latest available version in repository

### Commit Messages

Follow Conventional Commits specification:
():

[optional body]

[optional footer]

#### Commit Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code formatting (no logic change)
- `refactor`: Code restructuring (no feature/fix)
- `perf`: Performance improvement
- `test`: Add/modify tests
- `chore`: Maintenance tasks
- `build`: Build system changes
- `ci`: CI/CD changes

#### Examples:

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-iw4w2ehvo" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Feature addition</span><span>
</span><span></span><span class="token" style="color:rgb(130, 170, 255)">git</span><span> commit </span><span class="token parameter" style="color:rgb(214, 222, 235)">-m</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;feat(libs): add detect_distro.lib.sh for multi-distro support
</span><span class="token" style="color:rgb(173, 219, 103)">
</span><span class="token" style="color:rgb(173, 219, 103)">- Detect Linux distribution family
</span><span class="token" style="color:rgb(173, 219, 103)">- Set package manager variables
</span><span class="token" style="color:rgb(173, 219, 103)">- Support Debian, Red Hat, and Arch families
</span><span class="token" style="color:rgb(173, 219, 103)">
</span><span class="token" style="color:rgb(173, 219, 103)">Refs: #foundation-phase2
</span><span class="token" style="color:rgb(173, 219, 103)">Version: v01.01.00_u2025-12-27&quot;</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Bug fix</span><span>
</span><span></span><span class="token" style="color:rgb(130, 170, 255)">git</span><span> commit </span><span class="token parameter" style="color:rgb(214, 222, 235)">-m</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;fix(conf): correct color codes for non-UTF8 terminals
</span><span class="token" style="color:rgb(173, 219, 103)">
</span><span class="token" style="color:rgb(173, 219, 103)">- Add fallback for terminals without color support
</span><span class="token" style="color:rgb(173, 219, 103)">- Fix tput error on minimal systems
</span><span class="token" style="color:rgb(173, 219, 103)">
</span><span class="token" style="color:rgb(173, 219, 103)">Refs: #bugfix-colors
</span><span class="token" style="color:rgb(173, 219, 103)">Version: v01.00.03_u2025-12-26&quot;</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Documentation</span><span>
</span><span></span><span class="token" style="color:rgb(130, 170, 255)">git</span><span> commit </span><span class="token parameter" style="color:rgb(214, 222, 235)">-m</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;docs(standards): add technical conventions reference
</span><span class="token" style="color:rgb(173, 219, 103)">
</span><span class="token" style="color:rgb(173, 219, 103)">- Shell script coding standards
</span><span class="token" style="color:rgb(173, 219, 103)">- File organization and naming
</span><span class="token" style="color:rgb(173, 219, 103)">- Version control guidelines
</span><span class="token" style="color:rgb(173, 219, 103)">
</span><span class="token" style="color:rgb(173, 219, 103)">Refs: #foundation-phase1
</span><span class="token" style="color:rgb(173, 219, 103)">Version: v01.00.02_u2025-12-26&quot;</span><span>
</span></code></pre></div>

### Git Tags

Create annotated tags for all releases:

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-3f5e38xiz" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(130, 170, 255)">git</span><span> tag </span><span class="token parameter" style="color:rgb(214, 222, 235)">-a</span><span> v01.00.02 </span><span class="token parameter" style="color:rgb(214, 222, 235)">-m</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Release v01.00.02 - Technical Standards
</span><span class="token" style="color:rgb(173, 219, 103)">
</span><span class="token" style="color:rgb(173, 219, 103)">Added:
</span><span class="token" style="color:rgb(173, 219, 103)">- Complete technical standards documentation
</span><span class="token" style="color:rgb(173, 219, 103)">- Coding conventions reference
</span><span class="token" style="color:rgb(173, 219, 103)">- Version control guidelines
</span><span class="token" style="color:rgb(173, 219, 103)">
</span><span class="token" style="color:rgb(173, 219, 103)">Date: 2025-12-26&quot;</span><span>
</span></code></pre></div>

---

## Documentation

### Markdown Standards

- Use ATX-style headers (`#` not `===`)
- Include table of contents for documents >500 lines
- Use fenced code blocks with language identifier
- Include examples for all features
- Keep line length ≤100 characters
- Use relative links for internal references

### Required Documentation Files

- `README.md` - Project overview and quick start
- `CHANGELOG.md` - Version history (Keep a Changelog format)
- `RELEASE_NOTES.md` - Latest version details
- `INSTALL.md` - Installation instructions
- `STANDARDS.md` - Technical conventions (this document)
- `CONTRIBUTING.md` - Contribution guidelines
- `SECURITY.md` - Security policies

### CHANGELOG Format

Follow [Keep a Changelog](https://keepachangelog.com) format:

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">markdown</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-xvrh1rosn" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-markdown" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token title" style="color:rgb(199, 146, 234);font-weight:bold">#</span><span class="token title" style="color:rgb(214, 222, 235);font-weight:bold"> Changelog Project SMARTI</span><span>
</span>
<span></span><span class="token title" style="color:rgb(199, 146, 234);font-weight:bold">##</span><span class="token title" style="color:rgb(214, 222, 235);font-weight:bold"> [01.00.02] - 2025-12-26</span><span>
</span>
<span></span><span class="token title" style="color:rgb(199, 146, 234);font-weight:bold">###</span><span class="token title" style="color:rgb(214, 222, 235);font-weight:bold"> Added</span><span>
</span><span></span><span class="token list" style="color:rgb(199, 146, 234)">-</span><span> New features
</span>
<span></span><span class="token title" style="color:rgb(199, 146, 234);font-weight:bold">###</span><span class="token title" style="color:rgb(214, 222, 235);font-weight:bold"> Changed</span><span>
</span><span></span><span class="token list" style="color:rgb(199, 146, 234)">-</span><span> Changes to existing features
</span>
<span></span><span class="token title" style="color:rgb(199, 146, 234);font-weight:bold">###</span><span class="token title" style="color:rgb(214, 222, 235);font-weight:bold"> Deprecated</span><span>
</span><span></span><span class="token list" style="color:rgb(199, 146, 234)">-</span><span> Features marked for removal
</span>
<span></span><span class="token title" style="color:rgb(199, 146, 234);font-weight:bold">###</span><span class="token title" style="color:rgb(214, 222, 235);font-weight:bold"> Removed</span><span>
</span><span></span><span class="token list" style="color:rgb(199, 146, 234)">-</span><span> Deleted features
</span>
<span></span><span class="token title" style="color:rgb(199, 146, 234);font-weight:bold">###</span><span class="token title" style="color:rgb(214, 222, 235);font-weight:bold"> Fixed</span><span>
</span><span></span><span class="token list" style="color:rgb(199, 146, 234)">-</span><span> Bug fixes
</span>
<span></span><span class="token title" style="color:rgb(199, 146, 234);font-weight:bold">###</span><span class="token title" style="color:rgb(214, 222, 235);font-weight:bold"> Security</span><span>
</span><span></span><span class="token list" style="color:rgb(199, 146, 234)">-</span><span> Security patches
</span></code></pre></div>

---

## Error Handling

### Exit Codes

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-is96sbp82" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Standard exit codes</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">EXIT_SUCCESS</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(247, 140, 108)">0</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">EXIT_GENERAL_ERROR</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(247, 140, 108)">1</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">EXIT_MISUSE</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(247, 140, 108)">2</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">EXIT_PERMISSION_DENIED</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(247, 140, 108)">126</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">EXIT_COMMAND_NOT_FOUND</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(247, 140, 108)">127</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">EXIT_INVALID_ARGUMENT</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(247, 140, 108)">128</span><span>
</span></code></pre></div>

### Error Messages

Always include context and actionable information:

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-vz7hgxrx9" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Bad: Vague error</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Error&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">exit</span><span> </span><span class="token" style="color:rgb(247, 140, 108)">1</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Good: Descriptive error with solution</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;ERROR: Failed to create directory &#x27;</span><span class="token" style="color:rgb(214, 222, 235)">${target_dir}</span><span class="token" style="color:rgb(173, 219, 103)">&#x27;&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Reason: Permission denied&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Solution: Run script with sudo privileges&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">exit</span><span> </span><span class="token" style="color:rgb(247, 140, 108)">126</span><span>
</span></code></pre></div>

### Trap Handlers

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-z25pnon8v" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Cleanup function executed on exit</span><span>
</span><span></span><span class="token function-name" style="color:rgb(130, 170, 255)">cleanup</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">exit_code</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(214, 222, 235)">$?</span><span>
</span>
<span>    </span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Remove temporary files</span><span>
</span><span>    </span><span class="token" style="color:rgb(127, 219, 202)">if</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">[</span><span class="token" style="color:rgb(199, 146, 234)">[</span><span> </span><span class="token parameter" style="color:rgb(214, 222, 235)">-n</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${temp_file</span><span class="token" style="color:rgb(127, 219, 202)">:-</span><span class="token" style="color:rgb(214, 222, 235)">}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">&amp;&amp;</span><span> </span><span class="token parameter" style="color:rgb(214, 222, 235)">-f</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${temp_file}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(199, 146, 234)">;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">then</span><span>
</span><span>        </span><span class="token" style="color:rgb(130, 170, 255)">rm</span><span> </span><span class="token parameter" style="color:rgb(214, 222, 235)">-f</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${temp_file}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span>    </span><span class="token" style="color:rgb(127, 219, 202)">fi</span><span>
</span>
<span>    </span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Log exit status</span><span>
</span><span>    log </span><span class="token" style="color:rgb(173, 219, 103)">&quot;INFO&quot;</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Script exited with code: </span><span class="token" style="color:rgb(214, 222, 235)">${exit_code}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span>
<span>    </span><span class="token" style="color:rgb(255, 203, 139)">exit</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${exit_code}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Register trap for EXIT, INT, TERM signals</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">trap</span><span> cleanup EXIT INT </span><span class="token environment" style="color:rgb(130, 170, 255)">TERM</span><span>
</span></code></pre></div>

---

## Internationalization

### Language Files Format

Language files in `i18n/` use KEY=VALUE format:

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-4ovoi42qw" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># i18n/us.lang (default)</span><span>
</span><span></span><span class="token assign-left" style="color:rgb(214, 222, 235)">MSG_SUCCESS</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;Operation completed successfully&quot;</span><span>
</span><span></span><span class="token assign-left" style="color:rgb(214, 222, 235)">MSG_ERROR</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;An error occurred&quot;</span><span>
</span><span></span><span class="token assign-left" style="color:rgb(214, 222, 235)">MSG_WARNING</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;Warning: Proceed with caution&quot;</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># i18n/pt_BR.lang</span><span>
</span><span></span><span class="token assign-left" style="color:rgb(214, 222, 235)">MSG_SUCCESS</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;Operação concluída com sucesso&quot;</span><span>
</span><span></span><span class="token assign-left" style="color:rgb(214, 222, 235)">MSG_ERROR</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;Ocorreu um erro&quot;</span><span>
</span><span></span><span class="token assign-left" style="color:rgb(214, 222, 235)">MSG_WARNING</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;Aviso: Prossiga com cautela&quot;</span><span>
</span></code></pre></div>

### Language Detection

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-2qd9chafs" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Auto-detect system locale</span><span>
</span><span></span><span class="token function-name" style="color:rgb(130, 170, 255)">detect_language</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">system_lang</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${</span><span class="token environment" style="color:rgb(130, 170, 255)">LANG</span><span class="token" style="color:rgb(127, 219, 202)">%%</span><span class="token" style="color:rgb(214, 222, 235)">.*}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span>
<span>    </span><span class="token" style="color:rgb(127, 219, 202)">case</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${system_lang}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">in</span><span>
</span><span>        pt_BR</span><span class="token" style="color:rgb(127, 219, 202)">|</span><span>pt</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;pt_BR&quot;</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">;</span><span class="token" style="color:rgb(199, 146, 234)">;</span><span>
</span><span>        *</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span>        </span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;us&quot;</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">;</span><span class="token" style="color:rgb(199, 146, 234)">;</span><span>
</span><span>    </span><span class="token" style="color:rgb(127, 219, 202)">esac</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Load language file</span><span>
</span><span></span><span class="token assign-left" style="color:rgb(214, 222, 235)">LANG_DEFAULT</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">$(</span><span class="token" style="color:rgb(214, 222, 235)">detect_language</span><span class="token" style="color:rgb(214, 222, 235)">)</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">source</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;/opt/smarti/i18n/</span><span class="token" style="color:rgb(214, 222, 235)">${LANG_DEFAULT}</span><span class="token" style="color:rgb(173, 219, 103)">.lang&quot;</span><span> </span><span class="token file-descriptor" style="color:rgb(214, 222, 235);font-weight:bold">2</span><span class="token" style="color:rgb(127, 219, 202)">&gt;</span><span>/dev/null </span><span class="token" style="color:rgb(127, 219, 202)">||</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">source</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;/opt/smarti/i18n/us.lang&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span></code></pre></div>

### Message Usage

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-8w88hxfag" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Use i18n variables for all user-facing messages</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${MSG_SUCCESS}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${SYMBOL_SUCCESS}</span><span class="token" style="color:rgb(173, 219, 103)"> </span><span class="token" style="color:rgb(214, 222, 235)">${MSG_OPERATION_COMPLETE}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Code comments remain in English</span><span>
</span><span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Calculate checksum for verification</span><span>
</span><span></span><span class="token assign-left" style="color:rgb(214, 222, 235)">checksum</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">$(</span><span class="token" style="color:rgb(214, 222, 235)">sha256sum </span><span class="token" style="color:rgb(214, 222, 235)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${file}</span><span class="token" style="color:rgb(214, 222, 235)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)"> </span><span class="token" style="color:rgb(127, 219, 202)">|</span><span class="token" style="color:rgb(214, 222, 235)"> </span><span class="token" style="color:rgb(130, 170, 255)">awk</span><span class="token" style="color:rgb(214, 222, 235)"> </span><span class="token" style="color:rgb(214, 222, 235)">&#x27;{print $1}&#x27;</span><span class="token" style="color:rgb(214, 222, 235)">)</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span></code></pre></div>

---

## Security

### Privilege Management

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-p7fbxn19c" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Check for root privileges</span><span>
</span><span></span><span class="token function-name" style="color:rgb(130, 170, 255)">ensure_sudo</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(127, 219, 202)">if</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">[</span><span class="token" style="color:rgb(199, 146, 234)">[</span><span> </span><span class="token environment" style="color:rgb(130, 170, 255)">$EUID</span><span> </span><span class="token parameter" style="color:rgb(214, 222, 235)">-ne</span><span> </span><span class="token" style="color:rgb(247, 140, 108)">0</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(199, 146, 234)">;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">then</span><span>
</span><span>        </span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;ERROR: This script requires root privileges&quot;</span><span>
</span><span>        </span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Solution: Run with sudo&quot;</span><span>
</span><span>        </span><span class="token" style="color:rgb(255, 203, 139)">exit</span><span> </span><span class="token" style="color:rgb(247, 140, 108)">126</span><span>
</span><span>    </span><span class="token" style="color:rgb(127, 219, 202)">fi</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Drop privileges when not needed</span><span>
</span><span></span><span class="token function-name" style="color:rgb(130, 170, 255)">run_as_user</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">username</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${1}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">shift</span><span>
</span><span>    </span><span class="token" style="color:rgb(130, 170, 255)">sudo</span><span> </span><span class="token parameter" style="color:rgb(214, 222, 235)">-u</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${username}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">$@</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span></code></pre></div>

### Input Validation

Always validate and sanitize user input:

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-89qpylhu4" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token function-name" style="color:rgb(130, 170, 255)">validate_input</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">input</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${1}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">pattern</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${2</span><span class="token" style="color:rgb(127, 219, 202)">:-</span><span class="token" style="color:rgb(127, 219, 202)">^</span><span class="token" style="color:rgb(199, 146, 234)">[</span><span class="token" style="color:rgb(214, 222, 235)">a-zA-Z0-9_-</span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(214, 222, 235)">+$}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span>
<span>    </span><span class="token" style="color:rgb(127, 219, 202)">if</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">[</span><span class="token" style="color:rgb(199, 146, 234)">[</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">!</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${input}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">=~</span><span> </span><span class="token" style="color:rgb(214, 222, 235)">${pattern}</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(199, 146, 234)">;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">then</span><span>
</span><span>        </span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;ERROR: Invalid input detected&quot;</span><span>
</span><span>        </span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Input: </span><span class="token" style="color:rgb(214, 222, 235)">${input}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span>        </span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Pattern: </span><span class="token" style="color:rgb(214, 222, 235)">${pattern}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span>        </span><span class="token" style="color:rgb(255, 203, 139)">return</span><span> </span><span class="token" style="color:rgb(247, 140, 108)">1</span><span>
</span><span>    </span><span class="token" style="color:rgb(127, 219, 202)">fi</span><span>
</span>
<span>    </span><span class="token" style="color:rgb(255, 203, 139)">return</span><span> </span><span class="token" style="color:rgb(247, 140, 108)">0</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Usage</span><span>
</span><span></span><span class="token" style="color:rgb(127, 219, 202)">if</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">!</span><span> validate_input </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${user_input}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(199, 146, 234)">;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">then</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">exit</span><span> </span><span class="token" style="color:rgb(247, 140, 108)">128</span><span>
</span><span></span><span class="token" style="color:rgb(127, 219, 202)">fi</span><span>
</span></code></pre></div>

### Secure Temporary Files

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-rrugrhcwf" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Use mktemp for temporary files</span><span>
</span><span></span><span class="token assign-left" style="color:rgb(214, 222, 235)">temp_file</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">$(</span><span class="token" style="color:rgb(214, 222, 235)">mktemp /tmp/smarti.XXXXXX</span><span class="token" style="color:rgb(214, 222, 235)">)</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Ensure cleanup on exit</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">trap</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&#x27;rm -f &quot;${temp_file}&quot;&#x27;</span><span> EXIT
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Set restrictive permissions</span><span>
</span><span></span><span class="token" style="color:rgb(130, 170, 255)">chmod</span><span> </span><span class="token" style="color:rgb(247, 140, 108)">600</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${temp_file}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span></code></pre></div>

### Path Safety

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-fiio462rm" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Always use absolute paths</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">SMARTI_DIR</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;/opt/smarti&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">CONFIG_DIR</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${SMARTI_DIR}</span><span class="token" style="color:rgb(173, 219, 103)">/conf&quot;</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Validate paths before operations</span><span>
</span><span></span><span class="token function-name" style="color:rgb(130, 170, 255)">validate_path</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">path</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${1}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span>
<span>    </span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Check if path exists</span><span>
</span><span>    </span><span class="token" style="color:rgb(127, 219, 202)">if</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">[</span><span class="token" style="color:rgb(199, 146, 234)">[</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">!</span><span> </span><span class="token parameter" style="color:rgb(214, 222, 235)">-e</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${path}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(199, 146, 234)">;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">then</span><span>
</span><span>        </span><span class="token" style="color:rgb(255, 203, 139)">return</span><span> </span><span class="token" style="color:rgb(247, 140, 108)">1</span><span>
</span><span>    </span><span class="token" style="color:rgb(127, 219, 202)">fi</span><span>
</span>
<span>    </span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Resolve to absolute path</span><span>
</span><span>    realpath </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${path}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span></code></pre></div>

---

## Logging System

### Log Levels

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-zj0k1humf" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Supported log levels (INFO is default)</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">LOG_LEVEL_DEBUG</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;DEBUG&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">LOG_LEVEL_INFO</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;INFO&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">LOG_LEVEL_WARN</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;WARN&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">readonly</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">LOG_LEVEL_ERROR</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;ERROR&quot;</span><span>
</span></code></pre></div>

### Log Function

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-7rc1fv3o3" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Centralized logging function</span><span>
</span><span></span><span class="token function-name" style="color:rgb(130, 170, 255)">log</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">level</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${1}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> </span><span class="token assign-left" style="color:rgb(214, 222, 235)">message</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${2}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> timestamp
</span>
<span>    </span><span class="token assign-left" style="color:rgb(214, 222, 235)">timestamp</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">$(</span><span class="token" style="color:rgb(130, 170, 255)">date</span><span class="token" style="color:rgb(214, 222, 235)"> </span><span class="token" style="color:rgb(214, 222, 235)">&#x27;+%Y-%m-%d %H:%M:%S&#x27;</span><span class="token" style="color:rgb(214, 222, 235)">)</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;[</span><span class="token" style="color:rgb(214, 222, 235)">${timestamp}</span><span class="token" style="color:rgb(173, 219, 103)">] [</span><span class="token" style="color:rgb(214, 222, 235)">${level}</span><span class="token" style="color:rgb(173, 219, 103)">] </span><span class="token" style="color:rgb(214, 222, 235)">${message}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">&gt;&gt;</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${LOG_FILE}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Usage examples</span><span>
</span><span>log </span><span class="token" style="color:rgb(173, 219, 103)">&quot;INFO&quot;</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Script started&quot;</span><span>
</span><span>log </span><span class="token" style="color:rgb(173, 219, 103)">&quot;WARN&quot;</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Configuration file missing, using defaults&quot;</span><span>
</span><span>log </span><span class="token" style="color:rgb(173, 219, 103)">&quot;ERROR&quot;</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Failed to connect to database&quot;</span><span>
</span><span>log </span><span class="token" style="color:rgb(173, 219, 103)">&quot;DEBUG&quot;</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;Variable value: </span><span class="token" style="color:rgb(214, 222, 235)">${var}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span></code></pre></div>

### Log Files

- **events.log** - Generic INFO-level log for all scripts
- **script_name.log** - Specific log for individual scripts
- Log rotation handled by system logrotate

---

## Symbols and Colors

### Symbol Usage

Load symbols from configuration:

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-a4jbctlr5" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Source symbol definitions</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">source</span><span> /opt/smarti/conf/symbols.conf
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Use in messages</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${SYMBOL_SUCCESS}</span><span class="token" style="color:rgb(173, 219, 103)"> Operation completed&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${SYMBOL_ERROR}</span><span class="token" style="color:rgb(173, 219, 103)"> Operation failed&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${SYMBOL_WARNING}</span><span class="token" style="color:rgb(173, 219, 103)"> Proceed with caution&quot;</span><span>
</span></code></pre></div>

### Color Usage

Load colors from configuration:

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-90tg1m3wh" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Source color definitions</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">source</span><span> /opt/smarti/conf/colors.conf
</span>
<span></span><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Use in output</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${COLOR_SUCCESS}</span><span class="token" style="color:rgb(173, 219, 103)">Success message</span><span class="token" style="color:rgb(214, 222, 235)">${RESET}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${COLOR_ERROR}</span><span class="token" style="color:rgb(173, 219, 103)">Error message</span><span class="token" style="color:rgb(214, 222, 235)">${RESET}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span><span></span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${COLOR_INFO}</span><span class="token" style="color:rgb(173, 219, 103)">Info message</span><span class="token" style="color:rgb(214, 222, 235)">${RESET}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span></code></pre></div>

---

## Testing Guidelines

### Function Testing

<div class="widget code-container remove-before-copy"><div class="code-header non-draggable"><span class="iaf s13 w700 code-language-placeholder">bash</span><div class="code-copy-button"><span class="iaf s13 w500 code-copy-placeholder">Copiar</span><img class="code-copy-icon" src="data:image/svg+xml;utf8,%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%20fill%3D%22none%22%3E%0A%20%20%3Cpath%20d%3D%22M10.8%208.63V11.57C10.8%2014.02%209.82%2015%207.37%2015H4.43C1.98%2015%201%2014.02%201%2011.57V8.63C1%206.18%201.98%205.2%204.43%205.2H7.37C9.82%205.2%2010.8%206.18%2010.8%208.63Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%20%20%3Cpath%20d%3D%22M15%204.42999V7.36999C15%209.81999%2014.02%2010.8%2011.57%2010.8H10.8V8.62999C10.8%206.17999%209.81995%205.19999%207.36995%205.19999H5.19995V4.42999C5.19995%201.97999%206.17995%200.999992%208.62995%200.999992H11.57C14.02%200.999992%2015%201.97999%2015%204.42999Z%22%20stroke%3D%22%23717C92%22%20stroke-width%3D%221.05%22%20stroke-linecap%3D%22round%22%20stroke-linejoin%3D%22round%22%2F%3E%0A%3C%2Fsvg%3E%0A" /></div></div><pre id="code-l129ccwsy" style="color:white;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none;padding:8px;margin:8px;overflow:auto;background:#011627;width:calc(100% - 8px);border-radius:8px;box-shadow:0px 8px 18px 0px rgba(120, 120, 143, 0.10), 2px 2px 10px 0px rgba(255, 255, 255, 0.30) inset"><code class="language-bash" style="white-space:pre;color:#d6deeb;font-family:Consolas, Monaco, &quot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace;text-align:left;word-spacing:normal;word-break:normal;word-wrap:normal;line-height:1.5;font-size:1em;-moz-tab-size:4;-o-tab-size:4;tab-size:4;-webkit-hyphens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none"><span class="token" style="color:rgb(99, 119, 119);font-style:italic"># Test functions use test_ prefix</span><span>
</span><span></span><span class="token function-name" style="color:rgb(130, 170, 255)">test_detect_distro</span><span class="token" style="color:rgb(199, 146, 234)">(</span><span class="token" style="color:rgb(199, 146, 234)">)</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">{</span><span>
</span><span>    </span><span class="token" style="color:rgb(255, 203, 139)">local</span><span> result
</span>
<span>    </span><span class="token assign-left" style="color:rgb(214, 222, 235)">result</span><span class="token" style="color:rgb(127, 219, 202)">=</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">$(</span><span class="token" style="color:rgb(214, 222, 235)">detect_distro</span><span class="token" style="color:rgb(214, 222, 235)">)</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span>
</span>
<span>    </span><span class="token" style="color:rgb(127, 219, 202)">if</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">[</span><span class="token" style="color:rgb(199, 146, 234)">[</span><span> </span><span class="token parameter" style="color:rgb(214, 222, 235)">-n</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span class="token" style="color:rgb(214, 222, 235)">${result}</span><span class="token" style="color:rgb(173, 219, 103)">&quot;</span><span> </span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(199, 146, 234)">]</span><span class="token" style="color:rgb(199, 146, 234)">;</span><span> </span><span class="token" style="color:rgb(127, 219, 202)">then</span><span>
</span><span>        </span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;✓ detect_distro test passed&quot;</span><span>
</span><span>        </span><span class="token" style="color:rgb(255, 203, 139)">return</span><span> </span><span class="token" style="color:rgb(247, 140, 108)">0</span><span>
</span><span>    </span><span class="token" style="color:rgb(127, 219, 202)">else</span><span>
</span><span>        </span><span class="token" style="color:rgb(255, 203, 139)">echo</span><span> </span><span class="token" style="color:rgb(173, 219, 103)">&quot;✗ detect_distro test failed&quot;</span><span>
</span><span>        </span><span class="token" style="color:rgb(255, 203, 139)">return</span><span> </span><span class="token" style="color:rgb(247, 140, 108)">1</span><span>
</span><span>    </span><span class="token" style="color:rgb(127, 219, 202)">fi</span><span>
</span><span></span><span class="token" style="color:rgb(199, 146, 234)">}</span><span>
</span></code></pre></div>

### Integration Testing

- Test on all supported distributions
- Verify dependency installation
- Check symbolic link creation
- Validate log file generation
- Test rollback functionality
- Verify cleanup procedures

---

## Additional Resources

- **Bash Best Practices:** [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
- **Semantic Versioning:** [semver.org](https://semver.org)
- **Conventional Commits:** [conventionalcommits.org](https://conventionalcommits.org)
- **Keep a Changelog:** [keepachangelog.com](https://keepachangelog.com)

---

**Last Updated:** 2025-12-26  
**Document Version:** v01.00.02_u2025-12-26
