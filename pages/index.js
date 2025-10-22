import Head from "next/head";
import styles from "../styles/Home.module.css";

export default function Home() {
  return (
    <div className={styles.container}>
      <Head>
        <title>Test</title>
        <meta
          name="description"
          content="Minimal Next.js app in current directory"
        />
      </Head>

      <main className={styles.main}>
        <h1 className={styles.title}>Test</h1>
        <p className={styles.description}>
          This is a minimal Next.js (JavaScript) app — placed at repository
          root.
        </p>
      </main>
    </div>
  );
}
