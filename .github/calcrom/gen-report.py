import json
import re
import sys


def parse_and_convert(input_text):
    total_code_match = re.search(r"(\d+)\s+total bytes of code", input_text)
    src_code_match = re.search(
        r"(\d+)\s+bytes of code in src \(([\d.]+)%\)", input_text
    )

    total_symbols_match = re.search(r"(\d+)\s+total symbols", input_text)
    documented_symbols_match = re.search(
        r"(\d+)\s+symbols documented \(([\d.]+)%\)", input_text
    )
    partially_documented_symbols_match = re.search(
        r"(\d+)\s+symbols partially documented \(([\d.]+)%\)", input_text
    )

    # Check for missing data
    if not (
        total_code_match
        and src_code_match
        and total_symbols_match
        and documented_symbols_match
        and partially_documented_symbols_match
    ):
        raise ValueError("Input text is missing expected patterns.")

    total_code = int(total_code_match.group(1))
    src_code = int(src_code_match.group(1))
    src_percent = float(src_code_match.group(2))

    matched_code = src_code
    matched_code_percent = src_percent

    documented_symbols = int(documented_symbols_match.group(1))
    documented_symbols_percent = float(documented_symbols_match.group(2))
    partially_documented_symbols = int(partially_documented_symbols_match.group(1))
    partially_documented_symbols_percent = float(
        partially_documented_symbols_match.group(2)
    )
    total_functions = int(total_symbols_match.group(1))

    output = {
        "measures": {
            "total_code": str(total_code),
            "matched_code": str(matched_code),
            "matched_code_percent": matched_code_percent,
            # "total_symbols": total_functions,
            # "documented_symbols": documented_symbols,
            # "documented_symbols_percent": documented_symbols_percent,
            # "partially_documented_symbols": partially_documented_symbols,
            # "partially_documented_symbols_percent": partially_documented_symbols_percent,
        }
    }

    return output


def main():
    if len(sys.argv) != 3:
        print("Usage: python convert_metrics.py <input_file> <output_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    with open(input_file, "r") as f:
        input_text = f.read()

    try:
        output_data = parse_and_convert(input_text)
    except ValueError as e:
        print(f"Error: {e}")
        sys.exit(1)

    with open(output_file, "w") as f:
        json.dump(output_data, f, indent=2)


if __name__ == "__main__":
    main()
