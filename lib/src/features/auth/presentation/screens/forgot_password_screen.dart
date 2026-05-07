import 'package:newsapp/src/imports/core_imports.dart';
import 'package:newsapp/src/imports/packages_imports.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final cs = context.theme.colorScheme;
    final tt = context.theme.textTheme;

    Future<void> handleForgotPassword() async {
      if (!(_formKey.currentState?.validate() ?? false)) {
        return;
      }
      setState(() {
        _isLoading = true;
      });
      try {
        final result = await AuthService.instance.forgotPassword(
          email: _emailController.text.trim(),
        );

        result.fold(
          (failure) =>
              showToast(context, message: failure.message, status: 'error'),
          (success) {
            if (mounted) {
              context.go(AppRoutes.login);
            }
          },
        );
      } catch (e) {
        showToast(context, message: e.toString(), status: 'error');
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }

    return Scaffold(
      appBar: AppTopBar(title: 'Forgot Password'),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: AppSpacing.xl.h),
                Text(
                  'Reset Password',
                  style:
                      tt.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: AppSpacing.sm.h),
                Text(
                  'Enter your email to receive a reset link',
                  textAlign: TextAlign.center,
                  style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                ),
                SizedBox(height: AppSpacing.xxxl.h),
                // Form Card
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        controller: _emailController,
                        enabled: !_isLoading,
                        keyboardType: TextInputType.emailAddress,
                        label: 'auth.email'.tr(),
                        prefixIcon: const Icon(Icons.email_outlined),
                        validator: (v) {
                          if (AppUtils.isBlank(v)) {
                            return 'auth.email_required'.tr();
                          }
                          if (!AppUtils.isValidEmail(v!)) {
                            return 'auth.email_invalid'.tr();
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppSpacing.xxl.h),
                      AppButton(
                        label: 'Send Reset Link',
                        isLoading: _isLoading,
                        onPressed: _isLoading ? null : handleForgotPassword,
                        width: ButtonSize.large,
                        isFullWidth: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
