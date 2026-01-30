# Punch
Simple, flexible CLI time tracking for developers.

Inspired by [zeit](https://github.com/mrusme/zeit), but designed for tracking work across initiatives, codebases, and contexts.

## Name
"Punch" as in punch card time clocks - a nod to the physical timecard systems that tracked work hours before digital tools.

## Philosophy
Track time at the right granularity - not too detailed (per-file changes), not too broad (just "worked today"). Track the **work chunks** that matter: initiatives, features, tasks.

## Core Concepts
- **Category** (optional): Who you're working for (`employer`, `personal`, or omit)
- **Project**: The initiative or area of work (`History Event Sourcing`, `punch`, `homelab`)
- **Task**: The specific work you're doing (`setup projections`, `arg parsing`)
- **Notes**: Optional timestamped context you add as you work

## Quick Start
```bash
# Start tracking
punch in -c employer -p "History Event Sourcing" -t "setup projections"

# Check what's running
punch

# Add a note to current task
punch log "found edge case with null timestamps"

# Switch to new task in same project
punch switch -t "testing migration"

# Finish current task
punch out

# Continue previous task
punch continue
punch continue -2  # go back 2 tasks

# View your time
punch card
punch card -p "History Event Sourcing"
punch card -c employer

# Check your report
punch tally
```

## Usage Examples
See the [vhs tape](./usage.tape) for a full walkthrough, or run `vhs usage.tape` to generate the demo.

## Roadmap

**MVP (current focus):**
- Core commands: status, in, out, continue, correct, switch, log, void, card
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
zeit is great! punch is just my take on it:
- Flexible project/initiative tracking without rigid nesting that makes sense for me
- Category support for multi-client/employer workflows
- Timestamped notes within tasks
