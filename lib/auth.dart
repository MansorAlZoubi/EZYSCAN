import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;


  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //Sign in with the credentials
    await auth.signInWithCredential(credential);
  }

  createNewUser(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);

      try{
        await auth.currentUser.sendEmailVerification();
      }
      catch(e)
      {
        print("an error occurred with email verification");
        print(e.message);
      }

    } on FirebaseAuthException catch (e)
    {
      if(e.code == "weak-password")
      {
        print("Password too weak");
      }
      else if (e.code == "email-already-in-use")
      {
        print("Email is already in use");
      }
    } catch(e)
    {
      print(e.message);
    }

  }

  isSignedIn()
  {
    return auth.currentUser != null;
  }
  signIn(String email, String password)
  async {
    if(auth.currentUser.emailVerified) {
      try {
        Future<UserCredential> user = auth.signInWithEmailAndPassword(email: email, password: password);
        return user;
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
          print("Email does not exist");
        }
        if (e.code == "wrong-password") {
          print("Wrong password");
        }
      } catch (e) {
        print(e);
      }
    }
    return null;
  }

  Future<void> resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  isVerified() {
    return auth.currentUser.emailVerified;
  }



}