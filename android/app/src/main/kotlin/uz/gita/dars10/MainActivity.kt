package uz.gita.dars10

import kotlin.random.Random
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channel1 = "uz.gita/channel1"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channel1
        ).setMethodCallHandler { call, result ->
            if (call.method == "getRandomNumber") {
                val rand = Random.nextInt(100)
                result.success(rand)
            } else if (call.method == "sum") {
                val rand = Random.nextInt(100)
                result.success(rand)
            } else {
                result.notImplemented()
            }
        }
    }
}
