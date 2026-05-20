# Streak Tracker

Per-user check-in streak. Each new Stacks block where you check in extends your streak by one.

## Contract

- **Address:** `SP20Z3WPE6PVN1B8APDQNDH5BR1AJNMR25QPCSGFT.streak-tracker`
- **Network:** Stacks Mainnet
- **Clarity Version:** 4

## Functions

- `(check-in)` — bump your streak. New block since last check-in = +1.
- `(get-streak user)` — read-only, `{ count, last-block }` tuple for a user.
- `(total)` — read-only, total check-ins across all users.

## Frontend

Static HTML in `frontend/`. Connect, check in.

## License

MIT

---

_Last updated: 2026-05-20_
