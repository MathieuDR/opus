# opus
Simple, flexible CLI time tracking for developers.

Inspired by [zeit](https://github.com/mrusme/zeit), but designed for tracking work across initiatives, codebases, and contexts.

## Philosophy
Track time at the right granularity - not too detailed (per-file changes), not too broad (just "worked today"). Track the **work chunks** that matter: initiatives, features, tasks.

## Core Concepts
- **Category** (optional): Who you're working for (`employer`, `personal`, or omit)
- **Project**: The initiative or area of work (`History Event Sourcing`, `opus`, `homelab`)
- **Task**: The specific work you're doing (`setup projections`, `arg parsing`)
- **Notes**: Optional timestamped context you add as you work

## Quick Start
```bash
# Start tracking
opus start -c employer -p "History Event Sourcing" -t "setup projections"

# Check what's running
opus

# Add a note to current task
opus log "found edge case with null timestamps"

# Switch to new task in same project
opus switch -t "testing migration"

# Finish current task
opus done

# Continue previous task
opus continue
opus continue -2  # go back 2 tasks

# View your time
opus list
opus list -p "History Event Sourcing"
opus list -c employer
```

## Usage Examples
See the [vhs tape](./usage.tape) for a full walkthrough, or run `vhs usage.tape` to generate the demo.

## Roadmap

**MVP (current focus):**
- Core commands: status, start, done, continue, amend, switch, log
- JSON-based storage
- Basic list/filter commands
- Time calculations and summaries

**Nice to have:**
- Statistics with visualizations (charts, bars, colors)
- Export to CSV/timesheet formats
- PWD-based project detection
- GitHub/Linear integration for auto-filling tasks
- [?] Reading Git log for 'reading tasks' and timestamps
- Waybar/status bar integration
- Configurable project shortcuts/aliases

## Development
Built with Zig to learn systems programming and create a fast, dependency-light tool.
```bash
# Build
zig build

# Run tests
zig build test
```

## Why not zeit?
zeit is great! opus is just my take on it:
- Flexible project/initiative tracking without rigid nesting that makes sense for me
- Category support for multi-client/employer workflows
- Timestamped notes within tasks
