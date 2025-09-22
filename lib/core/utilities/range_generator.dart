import 'result_handle.dart';

// ฟังก์ชันหลักสำหรับสร้างช่วงข้อมูลตามที่ผู้ใช้ป้อน
class RangeGenerator {
  RangeGenerator._();
  // ฟังก์ชันหลักสำหรับสร้างช่วงข้อมูลตามที่ผู้ใช้ป้อน
  static Result<List<String>> create(String startValue, String endValue) {
    // ตรวจสอบข้อมูลที่ป้อนเข้ามา
    if (startValue.isEmpty || endValue.isEmpty) {
      return Result<List<String>>(
        error: Failure(
          code: 'RANGE_GEN_INPUT_EMPTY',
          message: 'Please, enter start and end value.',
        ),
      );
    }

    // // แปลงค่าเริ่มต้นและสิ้นสุดให้เป็นตัวพิมพ์เล็กทั้งหมดเพื่อจัดการแบบ Case-insensitive
    // final lowerStartValue = startValue.toLowerCase();
    // final lowerEndValue = endValue.toLowerCase();

    // กำหนดรูปแบบการตรวจสอบข้อมูล
    final numericRegex = RegExp(r'^-?[0-9]+$');
    final alphanumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
    final anyAlphaRegex = RegExp(r'^\p{L}+$', unicode: true); // RegExp ที่รองรับตัวอักษรทุกภาษา

    // ตรวจสอบประเภทของข้อมูลเริ่มต้นและสิ้นสุด
    final isStartNumeric = numericRegex.hasMatch(startValue);
    final isEndNumeric = numericRegex.hasMatch(endValue);
    final isStartAnyAlpha = anyAlphaRegex.hasMatch(startValue);
    final isEndAnyAlpha = anyAlphaRegex.hasMatch(endValue);

    // เงื่อนไข 3: ตรวจสอบว่าข้อมูลเริ่มต้นและสิ้นสุดเป็นชนิดเดียวกันหรือไม่
    if (isStartNumeric != isEndNumeric || isStartAnyAlpha != isEndAnyAlpha) {
      return Result<List<String>>(
        error: Failure(
          code: 'RANGE_GEN_TYPE_MISMATCH',
          message: 'Start and end values must be of the same type.',
        ),
      );
    }

    // ฟังก์ชันย่อยสำหรับสร้างช่วงตัวเลข (ไม่มีการเปลี่ยนแปลง)
    List<String> generateNumericRange(int start, int end) {
      List<String> result = [];
      if (start > end) {
        for (int i = start; i >= end; i--) {
          result.add(i.toString());
        }
      } else {
        for (int i = start; i <= end; i++) {
          result.add(i.toString());
        }
      }
      return result;
    }

    // ฟังก์ชันย่อยสำหรับสร้างช่วงตัวอักษร (ปรับปรุงให้รองรับ Unicode และ Case-insensitive)
    // ใช้ Letter-case ตามค่าเริ่มต้น
    List<String> generateCharacterRange(String start, String end, [bool caseInsensitive = false]) {
      List<String> result = [];
      // String effectiveStart = caseInsensitive ? start.toLowerCase() : start;
      // String effectiveEnd = caseInsensitive ? end.toLowerCase() : end;

      final startCode = start.codeUnitAt(0);
      final endCode = end.codeUnitAt(0);

      if (startCode > endCode) {
        for (int i = startCode; i >= endCode; i--) {
          result.add(String.fromCharCode(i));
        }
      } else {
        for (int i = startCode; i <= endCode; i++) {
          result.add(String.fromCharCode(i));
        }
      }
      return result;
    }

    // ฟังก์ชันย่อยสำหรับสร้างช่วงตัวอักษรผสมตัวเลข (ปรับปรุงให้รองรับ Case-insensitive)
    Result<List<String>> generateAlphaNumericRange(String start, String end) {
      final numAlphaRegex = RegExp(r'^[0-9]+[a-zA-Z]+$');
      final alphaNumRegex = RegExp(r'^[a-zA-Z]+[0-9]+$');

      final isStartNumAlpha = numAlphaRegex.hasMatch(start);
      final isStartAlphaNum = alphaNumRegex.hasMatch(start);
      final isEndNumAlpha = numAlphaRegex.hasMatch(end);
      final isEndAlphaNum = alphaNumRegex.hasMatch(end);

      // เงื่อนไข: ตรวจสอบว่ารูปแบบของ start และ end ต้องตรงกัน
      if (isStartNumAlpha != isEndNumAlpha || isStartAlphaNum != isEndAlphaNum) {
        return Result<List<String>>(
          error: Failure(
            code: 'RANGE_GEN_INVALID_ALPHANUM_RANGE',
            message: 'For alphanumeric ranges, the pattern (e.g., 1A vs A1) must be consistent.',
          ),
        );
      }

      String alphaPart;
      int numericPart;
      String endAlphaPart;
      int endNumericPart;

      if (isStartNumAlpha) {
        // กรณีรูปแบบเป็น ตัวเลข-ตัวอักษร เช่น 1A, 2B
        alphaPart = start.replaceAll(RegExp(r'[0-9]'), '');
        numericPart = int.parse(start.replaceAll(RegExp(r'[^0-9]'), ''));
        endAlphaPart = end.replaceAll(RegExp(r'[0-9]'), '');
        endNumericPart = int.parse(end.replaceAll(RegExp(r'[^0-9]'), ''));
      } else if (isStartAlphaNum) {
        // กรณีรูปแบบเป็น ตัวอักษร-ตัวเลข เช่น A1, B2
        alphaPart = start.replaceAll(RegExp(r'[0-9]'), '');
        numericPart = int.parse(start.replaceAll(RegExp(r'[^0-9]'), ''));
        endAlphaPart = end.replaceAll(RegExp(r'[0-9]'), '');
        endNumericPart = int.parse(end.replaceAll(RegExp(r'[^0-9]'), ''));
      } else {
        return Result<List<String>>(
          error: Failure(
            code: 'RANGE_GEN_INVALID_ALPHANUM_FORMAT',
            message: 'Invalid alphanumeric format.',
          ),
        );
      }

      // เงื่อนไข 5: ตรวจสอบว่ามีส่วนใดส่วนหนึ่งคงที่หรือไม่
      final isAlphaPartConstant = alphaPart.toLowerCase() == endAlphaPart.toLowerCase();
      final isNumericPartConstant = numericPart == endNumericPart;

      if (!isAlphaPartConstant && !isNumericPartConstant) {
        return Result<List<String>>(
          error: Failure(
            code: 'RANGE_GEN_INVALID_ALPHANUM_CONST',
            message:
                'For alphanumeric ranges, either the numeric or alphabetic part must be constant.',
          ),
        );
      }

      var resultList = <String>[];
      // สร้างผลลัพธ์ตามเงื่อนไข
      if (isAlphaPartConstant) {
        // กรณีที่ตัวอักษรคงที่ (รันเฉพาะตัวเลข)
        // final generatedNumbers = _generateNumericRange(numericPart, endNumericPart);
        // return generatedNumbers.map((n) => '$alphaPart$n').toList();

        final rangeList = generateNumericRange(
          numericPart,
          endNumericPart,
        ); //.map((n) => '$alphaPart$n').toList();
        if (isStartNumAlpha) {
          resultList = rangeList.map((n) => '$n$alphaPart').toList();
        } else if (isStartAlphaNum) {
          resultList = rangeList.map((n) => '$alphaPart$n').toList();
        }
        return Result<List<String>>(success: resultList);
      } else if (isNumericPartConstant) {
        // กรณีที่ตัวเลขคงที่ (รันเฉพาะตัวอักษร)
        // final generatedChars = _generateCharacterRange(alphaPart, endAlphaPart);
        // return generatedChars.map((c) => '$c$numericPart').toList();

        final rangeList = generateCharacterRange(
          alphaPart,
          endAlphaPart,
        ); //.map((c) => '$c$numericPart').toList();
        if (isStartNumAlpha) {
          resultList = rangeList.map((c) => '$numericPart$c').toList();
        } else if (isStartAlphaNum) {
          resultList = rangeList.map((c) => '$c$numericPart').toList();
        }
        return Result<List<String>>(success: resultList);
      }

      return Result<List<String>>(
        error: Failure(
          code: 'RANGE_GEN_INVALID_RANGE_FORMAT',
          message: 'Invalid alphanumeric range format.',
        ),
      );
    }

    // กรณีเป็นตัวเลขล้วน
    if (isStartNumeric && isEndNumeric) {
      final rangeList = generateNumericRange(int.parse(startValue), int.parse(endValue));
      return Result<List<String>>(success: rangeList);
    }

    // กรณีเป็นตัวอักษรล้วน (ทุกภาษา)
    if (isStartAnyAlpha && isEndAnyAlpha) {
      // ส่งค่าที่แปลงเป็นตัวพิมพ์เล็กแล้วเข้าไปในฟังก์ชันย่อย
      final rangeList = generateCharacterRange(startValue, endValue);
      return Result<List<String>>(success: rangeList);
    }

    // กรณีเป็นตัวอักษรผสมตัวเลข
    if (alphanumericRegex.hasMatch(startValue) && alphanumericRegex.hasMatch(endValue)) {
      // ส่งค่าที่แปลงเป็นตัวพิมพ์เล็กแล้วเข้าไปในฟังก์ชันย่อย
      return generateAlphaNumericRange(startValue, endValue);
    }

    // กรณีไม่ตรงกับเงื่อนไขข้างต้น
    return Result<List<String>>(
      error: Failure(
        code: 'RANGE_GEN_INVALID_INPUT_FORMAT',
        message: 'Invalid input format. Please use a consistent pattern.',
      ),
    );
  }
}
